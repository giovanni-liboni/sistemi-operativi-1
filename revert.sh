#!/bin/bash
#################################################
# La directory non può contenere spazi nel nome #
#################################################
clear
# trasformo i parametri passati in un'unica variabile
file=`echo $@ | cut -d" " -f2-`
if test -z $file;then
	exit 0;
fi
# controllo se esite la cartella di backup
if ! [ -d .$1.bck ];then
  echo "Cartella di backup non esistente"
# controllo se la cartella di backup non è vuota
elif [ -z "`ls .$1.bck/`" ];then
  echo "Cartella di backup vuota"
# la cartella di backup esiste e non è vuota
else
if test -z $1;then
	exit 0;
fi
# se la cartella repo non esiste la ricreo partendo da quella di backup
  if ! [ -d $1 ];then
    mkdir $1
  fi
# testo se devo ripristinare un solo file o tutta la cartella
  if [ $# -eq 1 ];then
      rm -rf ./$1/*
      cp -r ./.$1.bck/* ./$1/ 
      echo -e "Tutti i files sono stati ripristinati"

# ripristino solo il file che corrisponde al nome passato
  else
    find ./."$1".bck/ -type f -name "$file"| while read sorg
    do
	dest="`dirname "$sorg"| cut -d"/" -f 3-`"
	dest="`echo $1/$dest`"
	if test -d "$dest" ; then
	  cp "$sorg" "$dest"
	else
	  mkdir -p "$dest"
	  cp "$sorg" "$dest"
	fi
	echo -e "Il file $file è stato ripristinato"
    done
    if test -z "`find ./."$1".bck/ -type f -name "$file"`";then
      echo -e "Nessun file trovato con $file"
    fi
  fi
fi
