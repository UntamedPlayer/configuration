if [[ $# -ne 1 || $1 -eq "-h" ]]; then
    echo "USAGE: git-find-file.sh <filename-patter>\n\tfilename-pattern - a grep regex matching the desired file\n"
fi

for branch in $(git rev-list --all)
do
  if (git ls-tree -r --name-only $branch | grep --quiet "$1") 
  then
     echo $branch
  fi
done
