#!/bin/bash

usr_local=/usr/local
usr_local_include=${usr_local}/include
usr_local_lib=${usr_local}/lib
usr_local_opt=${usr_local}/opt
usr_local_opt_llvm=${usr_local_opt}/llvm
usr_local_opt_llvm_bin=${usr_local_opt_llvm}/bin
usr_local_opt_llvm_lib=${usr_local_opt_llvm}/lib
usr_local_opt_lld=${usr_local_opt}/lld
usr_local_opt_lld_bin=${usr_local_opt_lld}/bin
usr_local_opt_ncurses=${usr_local_opt}/ncurses

preset_name=${1:-"debug"}

cmake \
  -D CMAKE_C_COMPILER=${usr_local_opt_llvm_bin}/clang \
  -D CMAKE_CXX_COMPILER=${usr_local_opt_llvm_bin}/clang++ \
  -D CMAKE_CXX_FLAGS=-isystem\ ${usr_local_include} \
  -D CMAKE_EXE_LINKER_FLAGS=-L${usr_local_lib}\ -L${usr_local_opt_llvm_lib}/c++\ -L${usr_local_opt_llvm_lib}/unwind\ -lunwind\ -fuse-ld=lld \
  -D CMAKE_MODULE_LINKER_FLAGS=-L${usr_local_lib}\ -L${usr_local_opt_llvm_lib}/c++\ -L${usr_local_opt_llvm_lib}/unwind\ -lunwind\ -fuse-ld=lld \
  -D CMAKE_SHARED_LINKER_FLAGS=-L${usr_local_lib}\ -L${usr_local_opt_llvm_lib}/c++\ -L${usr_local_opt_llvm_lib}/unwind\ -lunwind\ -fuse-ld=lld \
  -D CMAKE_LINKER=${usr_local_opt_lld_bin}/ld.lld \
  -D CMAKE_PREFIX_PATH=${usr_local_opt_ncurses} \
  -D CMAKE_INSTALL_PREFIX=${usr_local} \
  -S . \
  --preset ${preset_name}
