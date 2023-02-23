#!/bin/bash

# reuperer les fichier
if [ $# -ne 3 ]; then
  echo "please you need to set the folder"
  read -p "put the folder name " folder
else
  folder=$1
fi

echo $folder
cd $folder
for f in *; do
#  echo $f
  if [[ "$f" == *"$2" ]]; then
    filename=`basename -s $2 $f`
    extention=$3
    mv "$f" "$filename$extention"
  fi
done