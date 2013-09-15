#!/bin/bash
clear
echo
# creo la variabile directory che contiene il nome del
# repository
directory=`echo $@`

# Se la cartella non esiste stampo a video un messaggio di avvertimento
if test -d "$directory";then

# Se la cartella di backup non esiste la creo
  if ! test -d ".$directory.bck";then
    mkdir ."$directory".bck
  fi

# cerco tutte le cartelle e i file presenti nella cartella di repo
# e con un ciclo while testo i files e le cartelle
  find "$directory" |sort | while read dirRepo
  do

#   se il nome della cartella è diverso da quello del repository allora
#   proseguo se no salto alla prossima riga
    if ! test "`echo "$dirRepo" | cut -d"/" -f2-`" = "$directory";then

#     imposto la variabile con il path relativo dalla cartella di backup
      dirBackup=".$directory.bck/`echo "$dirRepo" | cut -d"/" -f2-`"

#     testo se il path è relativo a una cartella e se la cartella esiste 
#     nella cartella di backup
      if test -d "$dirRepo" && ! test -d "$dirBackup";then

#         creo la cartella se non esiste
	  mkdir -p "$dirBackup"
	  echo -e "Dir. creata    : ${dirRepo##/*}"

#     testo se il path è relativo ad un file
      elif test -f "$dirRepo";then

#       testo se il file è presente nella cartella di backup e se è differente
	if test -f "$dirBackup" && ! test -z "`diff "$dirRepo" "$dirBackup"`";then

# 	  copio il file se risulta differente
	  cp "$dirRepo" "$dirBackup"
	  echo -e "File aggiornato: ${dirRepo##*/}"

#     se il file non esiste in backup allora lo copio all'interno della cartella
      elif ! test -f "$dirBackup";then
	  cp "$dirRepo" "$dirBackup"
	  echo -e "File copiato   : ${dirRepo##*/}"
	fi
      fi
    fi
  done
  echo -e "\nTutto aggiornato"
else
  echo Attenzione! La directory $directory non esiste
fi
