for var in 1 2 3 4 hello world
do
  echo $var
done


for var1 in file[123] file[456] file[789]
do
  echo $var1
done

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

# Exercice 2
# creer un script qui calcule le nombre de fichier
# le nombre de repertoire, le nombre de fichier excutable
# d'un repertoire passer en argument
# si il y a pas d'argument on demande a l'utilisateur
# le dossier en question

# Exercice 3
# creer un script qui affiche en inverse le resultat de la
# commande ls


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