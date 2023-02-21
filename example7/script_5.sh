#!/bin/bash
# Exercice 5:

# recupere le group id d'un utilisateur entre en
# parametre a partir du fichier /etc/password

var1=`cat /etc/passwd | grep $1`

ligne_without_user=${var1#*:}
ligne_without_password=${ligne_without_user#*:}
ligne_without_uid=${ligne_without_password#*:}
groupid=${ligne_without_uid%%:*}

echo $groupid

var2=`cat /etc/passwd | grep $1 | cut -d: -f4`
echo $var2


echo $*
echo $@
echo $#
echo $?
echo $-
echo $$
echo $!
echo $0
echo $_
