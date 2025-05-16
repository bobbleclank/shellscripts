#!/bin/bash

for dir in "."
do
  echo $dir
  find $dir -maxdepth 1 -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i -style=file
done

for dir in "include" "lib" "src" "test" "benchmark" "example"
do
  echo $dir
  find $dir -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i -style=file
done
