#!/bin/bash
CXX=aarch64-linux-gnu-g++ \
CC=aarch64-linux-gnu-gcc \
cmake .. \
-DARMCOMPUTE_ROOT=$HOME/armnn-devenv/ComputeLibrary \
-DARMCOMPUTE_BUILD_DIR=$HOME/armnn-devenv/ComputeLibrary/build/ \
-DCMAKE_C_COMPILER_FLAGS=-fPIC \
-DBOOST_ROOT=$HOME/armnn-devenv/boost_arm64_install/ \
-DARMCOMPUTENEON=1 -DARMCOMPUTECL=1 -DARMNNREF=1 \
-DCAFFE_GENERATED_SOURCES=$HOME/armnn-devenv/caffe/build/include \
-DBUILD_CAFFE_PARSER=1 \
-DTF_GENERATED_SOURCES=$HOME/armnn-devenv/tensorflow-protobuf \
-DBUILD_TF_PARSER=1 \
-DPROTOBUF_ROOT=$HOME/armnn-devenv/google/x86_64_pb_install/ \
-DPROTOBUF_LIBRARY_DEBUG=$HOME/armnn-devenv/google/arm64_pb_install/lib/libprotobuf.so.15.0.1 \
-DPROTOBUF_LIBRARY_RELEASE=$HOME/armnn-devenv/google/arm64_pb_install/lib/libprotobuf.so.15.0.1
