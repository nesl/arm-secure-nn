﻿//
// Copyright © 2017 Arm Ltd. All rights reserved.
// SPDX-License-Identifier: MIT
//

#include "LoadedNetwork.hpp"
#include "Layer.hpp"
#include "Graph.hpp"
#include "Network.hpp"
#include "Runtime.hpp"
#include "Profiling.hpp"
#include "HeapProfiling.hpp"

#include <backendsCommon/CpuTensorHandle.hpp>
#include <backendsCommon/BackendRegistry.hpp>
#include <backendsCommon/IMemoryManager.hpp>
#include <backendsCommon/MemCopyWorkload.hpp>
#include <backendsCommon/MemSyncWorkload.hpp>

#include <boost/polymorphic_cast.hpp>
#include <boost/assert.hpp>
#include <boost/format.hpp>
#include <boost/log/trivial.hpp>

namespace armnn
{

using namespace std;

namespace
{

template <typename ExceptionType>
std::string ToErrorMessage(const char * prefix, const ExceptionType & error)
{
    std::stringstream ss;
    ss << prefix << " " << error.what();
    return ss.str();
}

} // anonymous

std::unique_ptr<LoadedNetwork> LoadedNetwork::MakeLoadedNetwork(std::unique_ptr<OptimizedNetwork> net,
                                                                std::string & errorMessage)
{
    std::unique_ptr<LoadedNetwork> loadedNetwork;

    auto Fail = [&](const std::exception& error) -> std::unique_ptr<LoadedNetwork>
    {
        errorMessage = ToErrorMessage("An error occurred when preparing the network workloads: ", error);
        BOOST_LOG_TRIVIAL(error) << errorMessage;

        return std::unique_ptr<LoadedNetwork>();
    };

    try
    {
        loadedNetwork.reset(new LoadedNetwork(std::move(net)));
    }
    catch (const armnn::RuntimeException& error)
    {
        return Fail(error);
    }
    catch (const armnn::Exception& error)
    {
        return Fail(error);
    }
    catch (const std::runtime_error& error)
    {
        return Fail(error);
    }

    return loadedNetwork;
}

LoadedNetwork::LoadedNetwork(std::unique_ptr<OptimizedNetwork> net)
    : m_OptimizedNetwork(std::move(net))
{
    // Create a profiler and register it for the current thread.
    m_Profiler = std::make_shared<Profiler>();
    ProfilerManager::GetInstance().RegisterProfiler(m_Profiler.get());

    Graph& order = m_OptimizedNetwork->GetGraph().TopologicalSort();
    //First create tensor handlers, backends and workload factories.
    //Handlers are created before workloads are.
    //Because workload creation can modify some of the handlers,
    //(for example the splitter and concat layers).
    for (auto&& layer : order)
    {
        auto const& backendId = layer->GetBackendId();
        if (m_Backends.count(backendId) == 0)
        {
            auto createBackend = BackendRegistryInstance().GetFactory(backendId);
            auto it = m_Backends.emplace(std::make_pair(backendId, createBackend()));

            IBackendInternal* backend = it.first->second.get();

            if (backend->SupportsTensorAllocatorAPI())
            {
                backend->RegisterTensorHandleFactories(m_TensorHandleFactoryRegistry);

                auto workloadFactory = backend->CreateWorkloadFactory(m_TensorHandleFactoryRegistry);
                m_WorkloadFactories.emplace(
                    std::make_pair(backendId, std::make_pair(std::move(workloadFactory), nullptr)));
            }
            else
            {
                IBackendInternal::IMemoryManagerSharedPtr memoryManager = backend->CreateMemoryManager();
                auto workloadFactory = backend->CreateWorkloadFactory(memoryManager);

                m_WorkloadFactories.emplace(
                    std::make_pair(backendId, std::make_pair(std::move(workloadFactory), memoryManager)));
            }
        }
    }

    for (auto&& layer : order)
    {
        auto& workloadFacory = GetWorkloadFactory(*layer);
        layer->CreateTensorHandles(m_TensorHandleFactoryRegistry, workloadFacory);
    }

    //Then create workloads.
    for (auto&& layer : order)
    {
        const IWorkloadFactory& workloadFactory = GetWorkloadFactory(*layer);

        switch (layer->GetType())
        {
        case LayerType::Input:
        case LayerType::Output:
            {
                // Inputs and outputs are treated in a special way - see EnqueueInput() and EnqueueOutput().
                break;
            }
        default:
            {
                auto workload = layer->CreateWorkload(m_OptimizedNetwork->GetGraph(), workloadFactory);

                if (!workload)
                {
                    const char* const layerName = layer->GetNameStr().length() != 0 ? layer->GetName() : "<Unnamed>";
                    throw InvalidArgumentException(boost::str(
                        boost::format("No workload created for layer (name: '%1%' type: '%2%') (compute '%3%')")
                        % layerName % static_cast<int>(layer->GetType()) % layer->GetBackendId().Get()
                    ));
                }

                printf("Fuck my life-------Renju--------\n workload layer name: %s, backednID is %s\n",
                  layer->GetName(), layer->GetBackendId().Get().c_str());
                m_WorkloadLayerQueue.push_back(move(layer));
                m_WorkloadQueue.push_back(move(workload));
                // release the constant data in the layer..
                layer->ReleaseConstantData();
                break;
            }
        }
    }
    printf("\n\n\n\n\n\n\n\n\n\n");

    // Set up memory.
    m_OptimizedNetwork->GetGraph().AllocateDynamicBuffers();

    // Now that the intermediate tensor memory has been set-up, do any post allocation configuration for each workload.
    for (auto& workload : m_WorkloadQueue)
    {
        workload->PostAllocationConfigure();
    }
}

TensorInfo LoadedNetwork::GetInputTensorInfo(LayerBindingId layerId) const
{
    for (auto&& inputLayer : m_OptimizedNetwork->GetGraph().GetInputLayers())
    {
        BOOST_ASSERT_MSG(inputLayer->GetNumOutputSlots() == 1, "Input layer should have exactly 1 output slot");
        if (inputLayer->GetBindingId() == layerId)
        {
            return inputLayer->GetOutputSlot(0).GetTensorInfo();
        }
    }

    throw InvalidArgumentException(boost::str(boost::format("No input layer is associated with id %1%") % layerId));
}

TensorInfo LoadedNetwork::GetOutputTensorInfo(LayerBindingId layerId) const
{
    for (auto&& outputLayer : m_OptimizedNetwork->GetGraph().GetOutputLayers())
    {
        BOOST_ASSERT_MSG(outputLayer->GetNumInputSlots() == 1, "Output layer should have exactly 1 input slot");
        BOOST_ASSERT_MSG(outputLayer->GetInputSlot(0).GetConnection(), "Input slot on Output layer must be connected");
        if (outputLayer->GetBindingId() == layerId)
        {
            return outputLayer->GetInputSlot(0).GetConnection()->GetTensorInfo();
        }
    }

    throw InvalidArgumentException(boost::str(boost::format("No output layer is associated with id %1%") % layerId));
}

const IWorkloadFactory& LoadedNetwork::GetWorkloadFactory(const Layer& layer) const
{
    const IWorkloadFactory* workloadFactory = nullptr;

    auto it = m_WorkloadFactories.find(layer.GetBackendId());
    if (it ==  m_WorkloadFactories.end())
    {
        throw RuntimeException(
            boost::str(
                boost::format("No workload factory for %1% to be used for layer: %2%")
                % layer.GetBackendId().Get()
                % layer.GetNameStr()),
            CHECK_LOCATION());
    }

    workloadFactory = it->second.first.get();

    BOOST_ASSERT_MSG(workloadFactory, "No workload factory");

    std::string reasonIfUnsupported;
    BOOST_ASSERT_MSG(IWorkloadFactory::IsLayerSupported(layer, {}, reasonIfUnsupported),
        "Factory does not support layer");
    boost::ignore_unused(reasonIfUnsupported);
    return *workloadFactory;
}

namespace {

// Non-copyable class owning accelerator-specific tensor data.
class TensorPin
{
public:
    TensorPin(std::unique_ptr<ITensorHandle> handle, const TensorInfo& info, LayerBindingId id)
        : m_TensorHandle(std::move(handle))
        , m_TensorInfo(info)
        , m_Id(id)
    {
    }

    ITensorHandle* GetTensorHandle() const { return m_TensorHandle.get(); }
    const TensorInfo& GetTensorInfo() const { return m_TensorInfo; }
    LayerBindingId GetBindingId() const { return m_Id; }

private:
    std::unique_ptr<ITensorHandle> m_TensorHandle;
    TensorInfo m_TensorInfo;
    LayerBindingId m_Id;
};

static const TensorPin& GetTensorPin(LayerBindingId id,
    const std::vector<TensorPin>& pins,
    char const* bindingPointDesc)
{
    auto it = std::find_if(pins.begin(), pins.end(),
        [id](const TensorPin& pin)
    {
        return pin.GetBindingId() == id;
    });

    if (it != pins.end())
    {
        return *it;
    }
    else
    {
        throw InvalidArgumentException(boost::str(
            boost::format("No tensor supplied for %1% %2%") % bindingPointDesc % id));
    }
}

// Stores data that needs to be kept accessible for the entire execution of a workload.
class WorkloadData
{
public:
    WorkloadData(const InputTensors& inputTensors, const OutputTensors& outputTensors)
    {
        m_InputTensorPins.reserve(inputTensors.size());
        m_OutputTensorPins.reserve(outputTensors.size());

        for (auto inputTensorPair : inputTensors)
        {
            auto inputTensor = inputTensorPair.second;

            std::unique_ptr<ITensorHandle> tensorHandle =
                std::make_unique<ConstPassthroughCpuTensorHandle>(inputTensor.GetInfo(),inputTensor.GetMemoryArea());
            LayerBindingId layerId = inputTensorPair.first;

            m_InputTensorPins.emplace_back(std::move(tensorHandle), inputTensor.GetInfo(), layerId);
        }

        for (auto outputTensorPair : outputTensors)
        {
            auto outputTensor = outputTensorPair.second;

            std::unique_ptr<ITensorHandle> tensorHandle =
                std::make_unique<PassthroughCpuTensorHandle>(outputTensor.GetInfo(), outputTensor.GetMemoryArea());
            LayerBindingId layerId = outputTensorPair.first;

            m_OutputTensorPins.emplace_back(std::move(tensorHandle), outputTensor.GetInfo(), layerId);
        }
    }

    const TensorPin& GetInputTensorPin(LayerBindingId id) const
    {
        return GetTensorPin(id, m_InputTensorPins, "input");
    }

    const TensorPin& GetOutputTensorPin(LayerBindingId id) const
    {
        return GetTensorPin(id, m_OutputTensorPins, "output");
    }

private:

    std::vector<TensorPin> m_InputTensorPins;
    std::vector<TensorPin> m_OutputTensorPins;
};

}

Status LoadedNetwork::EnqueueWorkload(const InputTensors& inputTensors,
                                      const OutputTensors& outputTensors)
{
    ARMNN_SCOPED_PROFILING_EVENT(Compute::Undefined, "EnqueueWorkload");

    const Graph& graph = m_OptimizedNetwork->GetGraph();

    // Walk graph to determine the order of execution.
    if (graph.GetNumLayers() < 2)
    {
        BOOST_LOG_TRIVIAL(warning) << "IRuntime::EnqueueWorkload()::Less than two nodes in graph";
        return Status::Failure;
    }

    // Data that must be kept alive for the entire execution of the workload.
    WorkloadData workloadData(inputTensors, outputTensors);

    if (graph.GetNumInputs() != inputTensors.size())
    {
        throw InvalidArgumentException("Number of inputs provided does not match network.");
    }

    // For each input to the network, call EnqueueInput with the data passed by the user.
    m_InputQueue.clear();
    m_InputQueue.reserve(graph.GetNumInputs());
    for (const BindableLayer* inputLayer : graph.GetInputLayers())
    {
        const TensorPin& pin = workloadData.GetInputTensorPin(inputLayer->GetBindingId());
        // printf("-----Renju Again------- Input layer name: %s\n", inputLayer->GetNameStr().c_str());
        m_InputLayerQueue.push_back(move(inputLayer));
        EnqueueInput(*inputLayer, pin.GetTensorHandle(), pin.GetTensorInfo());
    }

    // For each output to the network, call EnqueueOutput with the data passed by the user.
    m_OutputQueue.clear();
    m_OutputQueue.reserve(graph.GetNumOutputs());
    for (const BindableLayer* outputLayer : graph.GetOutputLayers())
    {
        const TensorPin& pin = workloadData.GetOutputTensorPin(outputLayer->GetBindingId());
        // printf("-----Renju Again------- Output layer name: %s\n", outputLayer->GetNameStr().c_str());
        m_OutputLayerQueue.push_back(move(outputLayer));
        EnqueueOutput(*outputLayer, pin.GetTensorHandle(), pin.GetTensorInfo());
    }

    bool executionSucceeded = true;

    {
        ARMNN_SCOPED_PROFILING_EVENT(Compute::Undefined, "Execute");
        ARMNN_SCOPED_HEAP_PROFILING("Executing");
        executionSucceeded = Execute();
    }

    return executionSucceeded ? Status::Success : Status::Failure;
}

void LoadedNetwork::EnqueueInput(const BindableLayer& layer, ITensorHandle* tensorHandle, const TensorInfo& tensorInfo)
{
    if (layer.GetType() != LayerType::Input)
    {
        throw InvalidArgumentException("EnqueueInput: given layer not an InputLayer");
    }

    if (tensorHandle == nullptr)
    {
        throw InvalidArgumentException("EnqueueInput: tensorHandle must not be NULL");
    }

    InputQueueDescriptor inputQueueDescriptor;
    WorkloadInfo info;

    inputQueueDescriptor.m_Inputs.push_back(tensorHandle);
    info.m_InputTensorInfos.push_back(tensorInfo);

    BOOST_ASSERT_MSG(layer.GetNumOutputSlots() == 1, "Can only handle Input Layer with one output");
    const OutputHandler& handler = layer.GetOutputHandler();
    const TensorInfo& outputTensorInfo = handler.GetTensorInfo();
    ITensorHandle* outputTensorHandle = handler.GetData();
    BOOST_ASSERT_MSG(outputTensorHandle != nullptr,
                     "Data should have been allocated.");
    inputQueueDescriptor.m_Outputs.push_back(outputTensorHandle);
    info.m_OutputTensorInfos.push_back(outputTensorInfo);

    MemorySourceFlags importFlags = outputTensorHandle->GetImportFlags();
    if (CheckFlag(importFlags, MemorySource::Malloc))  // Try import the input tensor
    {
        // This assumes a CPU Tensor handle
        void* mem = tensorHandle->Map(false);
        if (outputTensorHandle->Import(mem, MemorySource::Malloc))
        {
            tensorHandle->Unmap();
            return; // No need for a workload since the import has been done.
        }
        tensorHandle->Unmap();
    }

    // Create a mem copy workload for input since we could not import
    auto inputWorkload = std::make_unique<CopyMemGenericWorkload>(inputQueueDescriptor, info);

    BOOST_ASSERT_MSG(inputWorkload, "No input workload created");
    m_InputQueue.push_back(move(inputWorkload));
}

void LoadedNetwork::EnqueueOutput(const BindableLayer& layer, ITensorHandle* tensorHandle, const TensorInfo& tensorInfo)
{
    if (layer.GetType() != LayerType::Output)
    {
        throw InvalidArgumentException("EnqueueOutput: given layer not an OutputLayer");
    }

    if (tensorHandle == nullptr)
    {
        throw InvalidArgumentException("EnqueueOutput: tensorHandle must not be NULL");
    }

    OutputQueueDescriptor outputQueueDescriptor;
    WorkloadInfo info;

    outputQueueDescriptor.m_Outputs.push_back(tensorHandle);
    info.m_OutputTensorInfos.push_back(tensorInfo);

    BOOST_ASSERT_MSG(layer.GetNumInputSlots() == 1, "Output Layer should have exactly one input.");

    // Gets the output handler from the previous node.
    const OutputHandler& outputHandler = layer.GetInputSlots()[0].GetConnectedOutputSlot()->GetOutputHandler();

    const TensorInfo& inputTensorInfo = outputHandler.GetTensorInfo();
    ITensorHandle* inputTensorHandle = outputHandler.GetData();
    BOOST_ASSERT_MSG(inputTensorHandle != nullptr, "Data should have been allocated.");

    // Try import the output tensor.
    // Note: We can only import the output pointer if all of the following  hold true:
    // a) The imported pointer is aligned sufficiently
    // b) The tensor has zero padding
    // c) There is only one connection to the OutputSlot and it is to an OutputLayer.
    // d) The output pointer is allocated via malloc. (Other types will be supported in a later release)
    if (layer.GetInputSlots()[0].GetConnectedOutputSlot()->GetOwningLayer().GetType() != LayerType::Input)
    {
        if (layer.GetInputSlots()[0].GetConnectedOutputSlot()->GetNumConnections() == 1)
        {
            MemorySourceFlags importFlags = inputTensorHandle->GetImportFlags();
            if (CheckFlag(importFlags, MemorySource::Malloc))
            {
                void *mem = tensorHandle->Map(false);
                bool importOk = inputTensorHandle->Import(mem, MemorySource::Malloc);
                tensorHandle->Unmap();

                if (importOk)
                {
                    // Insert synchronization workload
                    MemSyncQueueDescriptor syncDesc;
                    syncDesc.m_Inputs.push_back(inputTensorHandle);
                    info.m_InputTensorInfos.push_back(inputTensorInfo);
                    auto syncWorkload = std::make_unique<SyncMemGenericWorkload>(syncDesc, info);
                    BOOST_ASSERT_MSG(syncWorkload, "No sync workload created");
                    m_OutputQueue.push_back(move(syncWorkload));

                    return; //No need to add the output workload below
                }
            }
        }
    }

    // If we got here then we couldn't import the memory, so add an output workload which performs a memcopy.
    outputQueueDescriptor.m_Inputs.push_back(inputTensorHandle);
    info.m_InputTensorInfos.push_back(inputTensorInfo);

    auto outputWorkload = std::make_unique<CopyMemGenericWorkload>(outputQueueDescriptor, info);
    BOOST_ASSERT_MSG(outputWorkload, "No output workload created");
    m_OutputQueue.push_back(move(outputWorkload));
}

void LoadedNetwork::AllocateWorkingMemory()
{
    if (m_IsWorkingMemAllocated)
    {
        return;
    }
    for (auto&& workloadFactory : m_WorkloadFactories)
    {
        IBackendInternal::IMemoryManagerSharedPtr memoryManager = workloadFactory.second.second;
        if (memoryManager)
        {
            memoryManager->Acquire();
        }
    }
    m_TensorHandleFactoryRegistry.AquireMemory();
    m_IsWorkingMemAllocated = true;
}

void LoadedNetwork::FreeWorkingMemory()
{
    std::lock_guard<std::mutex> lockGuard(m_WorkingMemMutex);
    if (!m_IsWorkingMemAllocated)
    {
        return;
    }
    // Informs the memory managers to release memory in it's respective memory group
    for (auto&& workloadFactory : m_WorkloadFactories)
    {
        IBackendInternal::IMemoryManagerSharedPtr memoryManager = workloadFactory.second.second;
        if (memoryManager)
        {
            memoryManager->Release();
        }
    }
    m_TensorHandleFactoryRegistry.ReleaseMemory();
    m_IsWorkingMemAllocated = false;
}

void LoadedNetwork::EncryptInput(char* image, unsigned int length, unsigned int unit_size, bool is_encrypt)
{
  TEEC_Result res;
  TEEC_UUID uuid = SECDEEP_UUID;
  uint32_t err_origin;

  if (!ctx || !sess)
  {
    ctx = static_cast<TEEC_Context*>(malloc(sizeof(TEEC_Context)));
    sess = static_cast<TEEC_Session*>(malloc(sizeof(TEEC_Session)));

    res = TEEC_InitializeContext(NULL, ctx);
  	if (res != TEEC_SUCCESS){
  		printf("TEEC_InitializeContext failed with code 0x%x", res);
      return;
    }

  	res = TEEC_OpenSession(ctx, sess, &uuid,
  			       TEEC_LOGIN_PUBLIC, NULL, NULL, &err_origin);
  	if (res != TEEC_SUCCESS){
  		printf("TEEC_Opensession failed with code 0x%x origin 0x%x",
  			res, err_origin);
      return;
    }
  }

  void* output = malloc(unit_size * length);

  TEEC_Operation op;

  memset(&op, 0, sizeof(op));
  op.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_TEMP_INPUT,
           TEEC_MEMREF_TEMP_OUTPUT,
					 TEEC_VALUE_INOUT, TEEC_NONE);
	op.params[0].tmpref.buffer = static_cast<void *>(image);
  op.params[0].tmpref.size = length * unit_size;
  op.params[1].tmpref.buffer = output;
  op.params[1].tmpref.size = length * unit_size;
  op.params[2].value.a = static_cast<unsigned int>(unit_size);

  if(is_encrypt)
  {
	   res = TEEC_InvokeCommand(sess, SANITIZE_DATA, &op,
				   &err_origin);
  }
  else {
    res = TEEC_InvokeCommand(sess, DESANITIZE_DATA, &op,
          &err_origin);
  }

  //Retry the TEE.
  if (res == TEEC_ERROR_RESET_TEE) {
    TEEC_CloseSession(sess);
    TEEC_FinalizeContext(ctx);
    res = TEEC_InitializeContext(NULL, ctx);
  	if (res != TEEC_SUCCESS){
      printf("TEEC_InitializeContext failed with code 0x%x", res);
      return;
    }

  	res = TEEC_OpenSession(ctx, sess, &uuid,
  			       TEEC_LOGIN_PUBLIC, NULL, NULL, &err_origin);
  	if (res != TEEC_SUCCESS){
      printf("TEEC_Opensession failed with code 0x%x origin 0x%x",
  			res, err_origin);
      return;
    }
    if(is_encrypt)
    {
  	   res = TEEC_InvokeCommand(sess, SANITIZE_DATA, &op,
  				   &err_origin);
    }
    else {
      res = TEEC_InvokeCommand(sess, DESANITIZE_DATA, &op,
            &err_origin);
    }
  }

  if (res != TEEC_SUCCESS) {
    printf("TEEC_InvokeCommand failed with code 0x%x origin 0x%x",
			res, err_origin);
    return;
  }

  // memset(&op, 0, unit_size);
  // op.paramTypes = TEEC_PARAM_TYPES(TEEC_MEMREF_TEMP_INPUT,
  //          TEEC_MEMREF_TEMP_OUTPUT,
	// 				 TEEC_VALUE_INOUT, TEEC_NONE);

  /*
  float test[length];
  op.params[0].tmpref.buffer = (void *)output;
  op.params[0].tmpref.size = length * unit_size;
  op.params[1].tmpref.buffer = (void *)test;
  op.params[1].tmpref.size = length * unit_size;
  op.params[2].value.a = unit_size;

  res = TEEC_InvokeCommand(&sess, DESANITIZE_DATA, &op,
				 &err_origin);
  if (res != TEEC_SUCCESS) {
    printf("TEEC_InvokeCommand2 failed with code 0x%x origin 0x%x",
      res, err_origin);
    return;
  }

  // Validating
  // printf("\n\n\n\nTesting the results!!!\n\n\n");
  int accurate = 0;
  int inaccurate = 0;
  for(int i = 0; i < length; i++) {
    if(test[i] - image[i] > 0.00001) {
      printf("Yao shou la! Not accurate.\n");
      printf("Image: %.3f, test: %.3f\n\n", image[i], test[i]);
      ++inaccurate;
    }
    else ++accurate;
  }
*/
  // memcpy(image, output, length * unit_size);
}

void LoadedNetwork::SecDeepInput(Layer* layer)
{
  unsigned int input_size = layer -> GetNumInputSlots();
  for(unsigned int i = 0 ; i < input_size; i++) {
    // printf("RL: SecDeepInput size - %u\n", input_size);
    // printf("RL: SecDeepInput i - %u\n", i);
    // Decrypt here to be further processed.
    InputSlot* input_slot = &(layer->GetInputSlot(i));
    OutputSlot* output_slot = input_slot->GetConnectedOutputSlot();
    OutputHandler* output_handler = &(output_slot->GetOutputHandler());
    TensorInfo info = output_handler -> GetTensorInfo();
    ITensorHandle* data = output_handler -> GetData();

    TensorShape shape = info.GetShape();
    unsigned int size = shape.GetNumElements();
    unsigned int unit_size = sizeof(float);

    // printf("RL - don't crash SecDeepInput: size - %u\n", size);
    char* memory = static_cast<char*>(malloc(size));
    data->CopyOutTo(memory);
    if(size % unit_size != 0) {
      ;
    }

    EncryptInput(memory, size/unit_size, unit_size, false);
  }
}

void LoadedNetwork::SecDeepOutput(Layer* layer)
{
  unsigned int output_size = layer -> GetNumOutputSlots();
  for(unsigned int i = 0; i < output_size; i++) {
    // Encrypt here for the next layer processing.
    OutputSlot* output_slot = &(layer->GetOutputSlot(i));
    OutputHandler* output_handler = &(output_slot->GetOutputHandler());
    TensorInfo info = output_handler -> GetTensorInfo();
    ITensorHandle* data = output_handler -> GetData();

    TensorShape shape = info.GetShape();
    unsigned int size = shape.GetNumElements();
    unsigned int unit_size = sizeof(float);

    char* memory = static_cast<char*>(malloc(size));
    data->CopyOutTo(memory);
    if(size % unit_size != 0) {
      ;
    }
    EncryptInput(memory, size/unit_size, unit_size, true);
  }
}

bool LoadedNetwork::Execute()
{
    bool success = true;

    auto Fail = [&](const std::exception& error)
    {
        BOOST_LOG_TRIVIAL(error) << "An error occurred attempting to execute a workload: " << error.what();
        success = false;
    };

    try
    {
        std::lock_guard<std::mutex> lockGuard(m_WorkingMemMutex);
        AllocateWorkingMemory();

        size_t count = 0;
        // printf("\n");
        for (auto& input : m_InputQueue)
        {
            // printf("RL (input): Input slot number: %u, Output slot number: %u\n",
            //     m_InputLayerQueue.at(count)->GetNumInputSlots(),
            //     m_InputLayerQueue.at(count)->GetNumOutputSlots());
            // printf("-----Renju-----: input count: %d\n", ++count);
            // printf("-----RENJU----fml: input name - %s\n", input->GetData());
            input->Execute();
            ++count;
        }
        // printf("-----Renju-----: total input count: %d, total input: %d\n",
        //       static_cast<int>(count), static_cast<int>(m_InputLayerQueue.size()));

        count = 0;
        for (auto& workload : m_WorkloadQueue)
        {
            // printf("-----Renju-----: workload count: %d\n", ++count);
            // printf("RL (workload): Input slot number: %u Output slot number: %d\n",
            //     m_WorkloadLayerQueue.at(count)->GetNumInputSlots(),
            //     m_WorkloadLayerQueue.at(count)->GetNumOutputSlots());

            // printf("RL (workload): Input size - %d; Output size - %d;", workload.m_Inputs.size(), workload.m_Outputs.size());
            SecDeepInput(m_WorkloadLayerQueue.at(count));
            workload->Execute();
            SecDeepOutput(m_WorkloadLayerQueue.at(count));
            ++count;
        }
        // printf("-----Renju-----: total workload: %d, total workload size: %d\n",
        //       static_cast<int>(count), static_cast<int>(m_WorkloadLayerQueue.size()));

        count = 0;
        for (auto& output: m_OutputQueue)
        {
            // printf("-----Renju-----: output count: %d\n", ++count);
            // printf("RL (output): Input slot number: %u, Output slot number: %u\n",
            //     m_OutputLayerQueue.at(count)->GetNumInputSlots(),
            //     m_OutputLayerQueue.at(count)->GetNumOutputSlots());
            output->Execute();
            ++count;
        }
        // printf("-----Renju-----: total output count: %d, total output size: %d\n",
        //       static_cast<int>(count), static_cast<int>(m_OutputLayerQueue.size()));
        // printf("\n");
        if(sess) TEEC_CloseSession(sess);
        if(ctx) TEEC_FinalizeContext(ctx);
    }
    catch (const RuntimeException& error)
    {
        Fail(error);
    }
    catch (const std::runtime_error& error)
    {
        Fail(error);
    }

    return success;
}

void LoadedNetwork::RegisterDebugCallback(const DebugCallbackFunction& func)
{
    for (auto&& workloadPtr: m_WorkloadQueue)
    {
        workloadPtr.get()->RegisterDebugCallback(func);
    }
}

}
