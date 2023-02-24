#!/bin/bash


# reuperer le fichier
if [ $# -ne 1 ]; then
  echo "please you need to set the databse"
  read -p "put the database file " database
else
  database=$1
fi

while read row; do
#  echo $row
  note=`echo "$row" | cut -d';' -f2`
  if [ $note -gt 10 ]; then
    name=`echo "$row" | cut -d';' -f1`
    echo "name is $name" " est ma note is $note"
  fi
done < $database
