# Shell Scripts

Shell scripts for CMake, Clang-Format, Clang-Tidy and GitHub.

## Prerequisites

```
brew install cmake ninja llvm lld ncurses clang-format gh
```

## CMake

```
ln -s build/debug/compile_commands.json .

cp ../shellscripts/cmake-configure.sh configure.sh
chmod 755 configure.sh

cp ../shellscripts/CMakeUserPresets.json .

./configure.sh
cmake --build build/debug

./configure.sh release
cmake --build build/release
```

## Clang-Format

```
cp ../shellscripts/clang-format.sh format.sh
chmod 755 format.sh

./format.sh
```

## Clang-Tidy

```
cp ../shellscripts/clang-tidy.sh tidy.sh
chmod 755 tidy.sh

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

Retrieve the ruleset's id.

```
gh api repos/{owner}/{repo}/rulesets -q '.[] | "\(.id)  \(.name)  [\(.enforcement)]"'
```

Replace the ruleset. Any setting the template does not state is reset to its
default.

```
gh api --method PUT repos/{owner}/{repo}/rulesets/<id> --input ../shellscripts/github-repo-ruleset.json
```

Delete the ruleset. There is no output on success.

```
gh api --method DELETE repos/{owner}/{repo}/rulesets/<id>
```
