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
