#!/bin/bash

if [[ -n "$1" ]]; then
  dirs="$1"
else
  dirs=". lib src include app test benchmark example"
fi

for dir in $dirs
do
  echo $dir
  [[ "$dir" == "." ]] && depth="-maxdepth 1" || depth=""
  find $dir $depth -iname '*.h' -o -iname '*.cpp' | xargs clang-format -i -style=file
done
