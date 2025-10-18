#!/bin/bash

if [[ -n "$1" ]]; then
  dirs="$1"
else
  dirs=". include lib src test benchmark example"
fi

for dir in $dirs
do
  echo $dir
  [[ "$dir" == "." ]] && depth="-maxdepth 1" || depth=""
  find $dir $depth -iname '*.h' -o -iname '*.cpp' | xargs clang-tidy
done
