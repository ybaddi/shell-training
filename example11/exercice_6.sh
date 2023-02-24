#!/bin/bash


if [ $# -ne 3 ]; then
  echo "please you need to set parametre"
  read -p "put the parametres " a b c
else
  a=$1
  b=$2
  c=$3
fi

echo $a
echo $b
echo $c

#compte delta
delta=$(( $b * $b - ( 4 * $a * $c )))

echo $delta
sqrt_delta=`echo "scale=4; sqrt($delta)" | bc`
echo $sqrt_delta

if [ $delta -lt 0 ]
then
  echo "aucune solution dans R"
elif [ $delta -eq 0 ]
then
  echo "il ya uen seule solution, qui est : $(( (-1 * $b) / (2 * $a ) ))"
else
  echo "il ya deux solutions, qui sont :
       $(( ( -1 * $b ) ))  "- racine de delta / "  $(( ( 2 * $a ) ))
       et
       $(( ( -1 * $b ) ))  "+ racine de delta / "  $(( ( 2 * $a ) ))"
fi
