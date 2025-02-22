#!/bin/bash

usr_local=/usr/local
usr_local_opt=${usr_local}/opt/llvm

cmake \
  -D CMAKE_C_COMPILER=${usr_local_opt}/bin/clang \
  -D CMAKE_CXX_COMPILER=${usr_local_opt}/bin/clang++ \
  -D CMAKE_CXX_FLAGS=-isystem\ ${usr_local}/include \
  -D CMAKE_EXE_LINKER_FLAGS=-L${usr_local}/lib \
  -D CMAKE_MODULE_LINKER_FLAGS=-L${usr_local}/lib \
  -D CMAKE_SHARED_LINKER_FLAGS=-L${usr_local}/lib \
  -D CMAKE_INSTALL_PREFIX=${usr_local} \
  -D CMAKE_LINKER=${usr_local_opt}/bin/ld.lld \
  ..
