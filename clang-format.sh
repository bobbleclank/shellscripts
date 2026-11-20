#!/bin/bash

git ls-files -- "${1:-.}" |
  grep -E '\.(h|cpp)$' |
  xargs clang-format -i -style=file
