# Shell Scripts

Shell scripts for CMake, Clang-Format, Clang-Tidy and GitHub.

## CMake

```
ln -s build/debug/compile_commands.json .

cp ../shellscripts/cmake-configure.sh .
chmod 755 cmake-configure.sh
mv cmake-configure.sh configure.sh

cp ../shellscripts/CMakeUserPresets.json .

./configure.sh
cmake --build build/debug/
```

## Clang-Format

```
cp ../shellscripts/clang-format.sh .
chmod 755 clang-format.sh
mv clang-format.sh format.sh

./format.sh
```

## Clang-Tidy

```
cp ../shellscripts/clang-tidy.sh .
chmod 755 clang-tidy.sh
mv clang-tidy.sh tidy.sh

./tidy.sh
```

## GitHub

Run from inside the target repository's clone.

```
bash ../shellscripts/github-repo-settings.sh
```

In the repository settings UI, turn off "Allow comments on individual commits".

Optionally, for public repositories, apply the branch ruleset.

```
gh api --method POST repos/{owner}/{repo}/rulesets --input ../shellscripts/github-repo-ruleset.json
```
