#!/bin/bash
clear
# trasformo i parametri passati in un'unica stringa
REPO=`echo $@`
# testo se la cartella esiste già
if test -d "$REPO";then
  echo -e "\nCartella <$REPO> già presente\n"
#   menù di scelta di cosa fare
  while(true)
  do
    echo -e "Impostare la cartella come principale? (y or n)"
    read x
    case $x in
      n)	exit 0;;
      y)if test -d ."$REPO".bck;then
	  exit 1
	else
	    echo -e "Creata cartella di backup .$REPO.bck"
	    mkdir ."$REPO".bck;
	    exit 1
	fi;;
      *)clear	
	echo -e "\n\nScelta non valida. Premere y o n.\n";;
    esac
  done
else
# creo la cartella di repository
  echo -e "\nCreata cartella "$REPO""
  mkdir "$REPO"
# testo se la cartella di repository esiste già
  if test -d ."$REPO".bck;then
    echo Cartella di backup esistente
  else
#   creo la cartella di backup
    echo -e "Creata cartella di backup ."$REPO".bck"
    mkdir ."$REPO".bck;
    ./repo.sh $REPO
  fi
fi
exit 1