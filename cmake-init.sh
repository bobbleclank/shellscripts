#!/bin/bash

usr_local=/usr/local
usr_local_bin=${usr_local}/bin
usr_local_include=${usr_local}/include
usr_local_lib=${usr_local}/lib
usr_local_opt=${usr_local}/opt/llvm
usr_local_opt_bin=${usr_local_opt}/bin
usr_local_opt_lib=${usr_local_opt}/lib

build_arg=${1:-"debug"}
if [ "$build_arg" == "debug" ]; then
  build_type=Debug
  build_path=build/debug
elif [ "$build_arg" == "release" ]; then
  build_type=Release
  build_path=build/release
else
  echo "Error: Invalid build type"
  exit 1
fi

cmake \
  -D CMAKE_C_COMPILER=${usr_local_opt_bin}/clang \
  -D CMAKE_CXX_COMPILER=${usr_local_opt_bin}/clang++ \
  -D CMAKE_CXX_FLAGS=-isystem\ ${usr_local_include} \
  -D CMAKE_EXE_LINKER_FLAGS=-L${usr_local_lib}\ -L${usr_local_opt_lib}/c++\ -L${usr_local_opt_lib}/unwind\ -lunwind\ -fuse-ld=lld \
  -D CMAKE_MODULE_LINKER_FLAGS=-L${usr_local_lib}\ -L${usr_local_opt_lib}/c++\ -L${usr_local_opt_lib}/unwind\ -lunwind\ -fuse-ld=lld \
  -D CMAKE_SHARED_LINKER_FLAGS=-L${usr_local_lib}\ -L${usr_local_opt_lib}/c++\ -L${usr_local_opt_lib}/unwind\ -lunwind\ -fuse-ld=lld \
  -D CMAKE_INSTALL_PREFIX=${usr_local} \
  -D CMAKE_LINKER=${usr_local_bin}/ld.lld \
  -D CMAKE_BUILD_TYPE=${build_type} \
  -B ${build_path} \
  -S .
