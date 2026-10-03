#!/bin/bash

set -e

ln -s build/debug/compile_commands.json .

cp ../shellscripts/cmake-configure.sh configure.sh
chmod 755 configure.sh

cp ../shellscripts/CMakeUserPresets.json .

./configure.sh debug
cmake --build build/debug

./configure.sh release
cmake --build build/release

cp ../shellscripts/clang-format.sh format.sh
chmod 755 format.sh

cp ../shellscripts/clang-tidy.sh tidy.sh
chmod 755 tidy.sh
