#!/bin/bash

set -e

ln -s build/debug/compile_commands.json .

cp ../shellscripts/cmake-configure.sh .
chmod 755 cmake-configure.sh
mv cmake-configure.sh configure.sh

cp ../shellscripts/CMakeUserPresets.json .

./configure.sh debug
cmake --build build/debug/

./configure.sh release
cmake --build build/release/

cp ../shellscripts/clang-format.sh .
chmod 755 clang-format.sh
mv clang-format.sh format.sh

cp ../shellscripts/clang-tidy.sh .
chmod 755 clang-tidy.sh
mv clang-tidy.sh tidy.sh
