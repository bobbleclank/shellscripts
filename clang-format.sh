#!/bin/bash

dirs=". include lib src test benchmark example"

for dir in $dirs
do
  echo $dir
  [[ "$dir" == "." ]] && depth="-maxdepth 1" || depth=""
  find $dir $depth -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i -style=file
done
