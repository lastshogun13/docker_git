#!/usr/bin/env bash

git config --global user.name "$1"
git config --global user.email "$2"

# for file in `\find /git -maxdepth 1 -type d`; do
#     echo $file;
# done

files="/git/*"
for filepath in $files; do
  if [ -d $filepath ]; then
    # 存在する場合
    cd $filepath
    git secrets --install > /dev/null 2>&1

    if [ -f "${filepath}/script/git_screts_allowed.sh" ]; then
      /bin/bash "${filepath}/script/git_screts_allowed.sh"
    fi

    cd ..
  fi
done

/bin/bash
