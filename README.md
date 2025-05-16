# Shell Scripts

Shell scripts for Clang-Format, Clang-Tidy and CMake.

## CMake

```
ln -s build/compile_commands.json .
cp ../shellscripts/cmake-init.sh .
chmod 755 cmake-init.sh

mkdir build
cp cmake-init.sh build
cd build
./cmake-init.sh
make
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
