#!/bin/bash

for dir in "."
do
  echo $dir
  find $dir -maxdepth 1 -iname '*.h' -o -iname '*.cpp' | xargs clang-tidy
done

for dir in "include" "lib" "src" "test" "example"
do
  echo $dir
  find $dir -iname '*.h' -o -iname '*.cpp' | xargs clang-tidy
done
