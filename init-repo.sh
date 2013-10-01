#!/bin/bash

#     This file is part of sistemi-operativi-1
#     (C) 2013 Giovanni Liboni

#     This library is free software; you can redistribute it and/or
#     modify it under the terms of the GNU Lesser General Public
#     License as published by the Free Software Foundation; either
#     version 2.1 of the License, or (at your option) any later version.

#     This library is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#     Lesser General Public License for more details.

#     You should have received a copy of the GNU Lesser General Public
#     License along with this library; if not, write to the Free Software
#     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
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
