## Exercice1
#
## calculer le min entre deux nombre passer en parametre
## ./script 3 4
## afficher 3
#
##if [ "$1" -lt "$2" ]
##then
##  echo $1
##else
##  echo $2
##fi
#
## lt less then
## le less then or equal
## gt greater then
## ge greater or equal then
#
## Exercice 2
#
## script qui affiche la montion A B C D selon la note
## de l'etudiant que le script demande a l'utilisateur
## A pour une note superieure a 16, B pour sup 14
## C pour sup a 12
## D pour sur a 10
#
#
#read -p "veullez entrer votre note " -t 6 note
#
#printf "\n le text entre est  $note"
#
#
#
#case $note in
#    16)
#      echo "A"
#      ;;
#    14)
#      echo "B"
#      ;;
#    12)
#      echo "C"
#      ;;
#    10)
#      echo "D"
#      ;;
#esac
#
## Exercice 3
#
## creer un script qui test l'existence d'un user
## entrer avec la commend read
## et afficher son uid
#
#
#read -p "Veuillez entrer l'utilisateur " user
##echo $user
#
#if grep "^$user:"  /etc/passwd > /dev/null
#then
#  echo `id $user | cut  -d' ' -f1`
#else
#  echo "user not exist"
#fi
#
#
## Exercice 4
## creer un script calcule qui permet de faire un calcule
## entre deux valeur
## entrer par l'utiliateur avec l'operation a realiser
#
##veuillez entrer oprand 1
##entre operand 2
##entre operation
#
#read -p "enter premier chifre " a
#read -p "enter deuxieme chifre " b
#read -p "enter l'operation " op
#
#case $op in
#    '+' | '-' | '*' | '/')
#      echo $(( $a $op $b))
#      ;;
#      *)
#       echo "operation not valide"
#esac
#
## Exercice 5
## creer un script qui affiche salut a l'utilisateur
## connecte sur la machine
## ./script.sh
#
#echo "Salut, "`whoami`
#echo "Salut, $USER"
#
## Exercice 6
## creer un script qui affiche le nombre d'utilisateur
## conncte sur la machine, on donnant le resultat suivant
## "il y a 5 personne connecte sur osboxes en ce moment"
## sachant que osboxes est le nom de la machine
#
#fabrice=`who | wc -l`
#echo "il y a $fabrice personne connecte sur `hostname` en ce moment "

# Exercice 7
#Créez un script "coupe" qui prend trois arguments,
# le premier étant un nom de fichier et les deux
# autres des entiers a et b, et qui affiche les lignes
# comprises entre a et b dans le fichier.
# Par exemple,
# coupe fic 4 8
#affichera les lignes 4 à 8 du fichier fic.
# Affichez des messages en cas d'erreur
# (nombre de paramètres incorrect, fichier inexistant,
# etc).

# sed


if [ $# != "3" ]
then
  echo "nombre de param incomplet"
fi

if [ ! -r $1 ]
then
  echo "file not exist"
fi

echo 'all param are ok'
echo "`cat $1 | sed -n -e "$2,$3p"` "
echo "========="
echo "`head -n $3 $1 | tail -n +$2` "