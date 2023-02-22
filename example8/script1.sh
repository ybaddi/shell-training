# Exercice1

# calculer le min entre deux nombre passer en parametre
# ./script 3 4
# afficher 3

#if [ "$1" -lt "$2" ]
#then
#  echo $1
#else
#  echo $2
#fi

# lt less then
# le less then or equal
# gt greater then
# ge greater or equal then

# Exercice 2

# script qui affiche la montion A B C D selon la note
# de l'etudiant que le script demande a l'utilisateur
# A pour une note superieure a 16, B pour sup 14
# C pour sup a 12
# D pour sur a 10


read -p "veullez entrer votre note " -t 6 note

printf "\n le text entre est  $note"



case $note in
    16)
      echo "A"
      ;;
    14)
      echo "B"
      ;;
    12)
      echo "C"
      ;;
    10)
      echo "D"
      ;;
esac

# Exercice 3

# creer un script qui test l'existence d'un user
# entrer avec la commend read
# et afficher son uid


read -p "Veuillez entrer l'utilisateur " user
#echo $user

if grep "^$user:"  /etc/passwd > /dev/null
then
  echo `id $user | cut  -d' ' -f1`
else
  echo "user not exist"
fi


# Exercice 4
# creer un script calcule qui permet de faire un calcule
# entre deux valeur
# entrer par l'utiliateur avec l'operation a realiser
