#for var in 1 2 3 4 hello world
#do
#  echo $var
#done
#
#
#for var1 in file[123] file[456] file[789]
#do
#  echo $var1
#done

# Exercice 1
# creer un script qui calcule le factorielle
# du premier parametre
# si le parametre n'existe pas il demande
# a l'utilisateur un chifre

# facto(0)=1
# facto(1)=1
# fact(2)=2
# fact(3)=6
# fact(n) = fact(n-1) * n
# fact(5) = 1 * 2 * 3 * 4 * 5

#if [ $# -eq 0 ]
#then
#  read -p "veuillez entrer uen valeur " num
#else
#  num=$1
#fi
#
#resultat=1
#for((i=2;i<=$num;i++))
#do
#  echo $i
#  resultat=$(( $resultat * $i ))
#done
#
#echo $resultat
#
#resultat2=1
#compteur=$num
#while [ $compteur -gt 1 ]
#do
#  resultat2=$(( resultat2 * $compteur ))
#  compteur=$(( $compteur - 1 ))
#done
#echo $resultat2



# Exercice 2
# creer un script qui calcule le nombre de fichier
# le nombre de repertoire, le nombre de fichier excutable
# d'un repertoire passer en argument
# si il y a pas d'argument on demande a l'utilisateur
# le dossier en question

#echo $1
if [ $# -eq 0 ]
then
  read -p "veuillez entrer un repertoir " rep
else
  rep=$1
fi


num_file=0
num_folder=0
num_exec=0
#echo $rep
cd $1
for f in *
do
  if [ -d $f ]; then
#    echo "$f est un dossier"
    num_folder=$(( $num_folder + 1 ))
    fi
  if [ -f $f ]; then
#    echo "$f est un fichier"
    num_file=$(( num_file + 1 ))
    fi
  if [ -x $f ]; then
#    echo "$f est un excutable"
    num_exec=$(( num_exec + 1 ))
    fi
#   echo "========"
done


echo "folder = $num_folder"
echo "fichier = $num_file"
echo "executable = $num_exec"



# Exercice 3
# creer un script qui affiche en inverse le resultat de la
# commande ls

compt=0
for fichier in * ; do
#  echo $fichier
  tab[$compt]=$fichier
  compt=$(( $compt + 1))
done
echo "==========="
#echo $compt
for(( i=$(( $compt - 1 ));i>=0;i=$i-1))
{
#  echo $i
  echo ${tab[$i]}
}



# exemple function qui calcule la some


function fonction {
     echo $(( $1 + $2 ))
}

echo `fonction $1 $2`
#Exercice 4:
# creer un script qui lit a partir d'un fichier csv d'une
# base de donnee des etudiant
# et afficher les etudiants w'ai ont la note superieure
# a 10
# exemple de fichier
# baddi;youssef;18
# adil;hicham;11
# hicham;reda;9
# le script affiche juste les deux premier