#!/usr/bin/env bash
# if [[ $# -ne 1 ]]; then
#     echo "USAGE: git-find-file-verbose.sh <filename-patter>\n\tfilename-pattern - a grep regex matching the desired file\n"
# fi
for branch in $(git rev-list --all)
do
  git ls-tree -r --name-only $branch | grep "$1" | sed 's/^/'$branch': /'
done
