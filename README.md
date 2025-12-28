# Shell Scripts

Shell scripts for Clang-Format, Clang-Tidy and CMake.

## CMake

```
ln -s build/debug/compile_commands.json .

cp ../shellscripts/cmake-configure.sh .
chmod 755 cmake-configure.sh

./cmake-configure.sh
cmake --build build/debug/
```

## Clang-Format

```
cp ../shellscripts/clang-format.sh .
chmod 755 clang-format.sh
mv clang-format.sh format.sh
```

## Clang-Tidy

```
cp ../shellscripts/clang-tidy.sh .
chmod 755 clang-tidy.sh
mv clang-tidy.sh tidy.sh
```
