#!/bin/bash




if [ $# -ne 1 ]; then
#  echo "please you need to set parametre"
  val=$(whiptail --title "valeur factoriel" \
  --inputbox "Enter la valeur : " 10 50 3>&1 1>&2 2>&3)
else
  val=$1
fi


#function fact
#{
#  num=$1
#  resultat=1
#  for((i=2;i<=$num;i++))
#  do
#  #  echo $i
#    resultat=$(( $resultat * $i ))
#  done
#           #
#  echo $resultat
#}

function fact
{
  num=$1
  if [ $num -eq 0 ]; then
      echo 1
  else
     echo $(( $num *   `fact $(( $num - 1))`  ))
  fi        #

}


#GNU = GNU is not unix
#      (GNU in not unix) is not unix
#      ( (GNU in not unix)) is not unix
#echo $val
#
echo `fact $val`


#mapfile -t rowsfile < $PWD/database.csv
#echo $rowsfile

readarray -t rows < $PWD/database.csv
echo ${rows[3]}
echo "+++++++++++"
for row in "${rows[@]}"
do
  echo $row
done