//
// Copyright © 2017 Arm Ltd. All rights reserved.
// SPDX-License-Identifier: MIT
//

#pragma once

#include <aclCommon/BaseMemoryManager.hpp>
#include <backendsCommon/ITensorHandleFactory.hpp>

namespace armnn
{

constexpr const char* NeonTensorHandleFactoryId() { return "Arm/Neon/TensorHandleFactory"; }

class NeonTensorHandleFactory : public ITensorHandleFactory
{
public:
    NeonTensorHandleFactory(std::weak_ptr<NeonMemoryManager> mgr)
                            : m_MemoryManager(mgr),
                              m_ImportFlags(static_cast<MemorySourceFlags>(MemorySource::Undefined)),
                              m_ExportFlags(static_cast<MemorySourceFlags>(MemorySource::Undefined))
    {}

    std::unique_ptr<ITensorHandle> CreateSubTensorHandle(ITensorHandle& parent,
                                                         const TensorShape& subTensorShape,
                                                         const unsigned int* subTensorOrigin) const override;

    std::unique_ptr<ITensorHandle> CreateTensorHandle(const TensorInfo& tensorInfo) const override;

    std::unique_ptr<ITensorHandle> CreateTensorHandle(const TensorInfo& tensorInfo,
                                                      DataLayout dataLayout) const override;

    static const FactoryId& GetIdStatic();

    const FactoryId& GetId() const override;

    bool SupportsSubTensors() const override;

    MemorySourceFlags GetExportFlags() const override;

    MemorySourceFlags GetImportFlags() const override;

private:
    mutable std::shared_ptr<NeonMemoryManager> m_MemoryManager;
    MemorySourceFlags m_ImportFlags;
    MemorySourceFlags m_ExportFlags;
};

} // namespace armnn
