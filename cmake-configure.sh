#!/bin/bash

brew_prefix=$(brew --prefix)
include=${brew_prefix}/include
lib=${brew_prefix}/lib
opt=${brew_prefix}/opt
opt_llvm=${opt}/llvm
opt_llvm_bin=${opt_llvm}/bin
opt_llvm_lib=${opt_llvm}/lib
opt_lld=${opt}/lld
opt_lld_bin=${opt_lld}/bin
opt_ncurses=${opt}/ncurses

linker_flags="-L${lib} -L${opt_llvm_lib}/c++ -L${opt_llvm_lib}/unwind -lunwind -fuse-ld=lld"
install_prefix=/usr/local

preset_name=${1:-"debug"}

cmake \
  -D CMAKE_C_COMPILER=${opt_llvm_bin}/clang \
  -D CMAKE_CXX_COMPILER=${opt_llvm_bin}/clang++ \
  -D CMAKE_CXX_FLAGS="-isystem ${include}" \
  -D CMAKE_EXE_LINKER_FLAGS="${linker_flags}" \
  -D CMAKE_MODULE_LINKER_FLAGS="${linker_flags}" \
  -D CMAKE_SHARED_LINKER_FLAGS="${linker_flags}" \
  -D CMAKE_LINKER=${opt_lld_bin}/ld64.lld \
  -D CMAKE_PREFIX_PATH=${opt_ncurses} \
  -D CMAKE_INSTALL_PREFIX=${install_prefix} \
  -S . \
  -G Ninja \
  --preset ${preset_name}
