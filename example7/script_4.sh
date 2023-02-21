# Exercice 4:

# recupere le shell de login d'un utilisateur entre en 
# parametre a partir du fichier /etc/password

# cat /etc/passwd | grep $1

var1=`cat /etc/passwd | grep $1`

echo ${var1##*:}

