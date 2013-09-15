#!/bin/bash
# Status elenca le differenze tra la cartella di repo e il backup della cartella
# medesima. Se un file è presente nella cartella di backup ma non nella cartella
# repo allora status non lo stamperà. 
clear
param=`echo $@`
echo
if ! test -d "$param";then
  echo Cartella "$param" non esistente
elif ! test -d ."$param".bck;then
  echo Cartella ."$param".bck non esistente
else
  echo "Files differenti: "
#   -type f : seleziona solo i file regolari
  find "$param" -type f |sort | while read dirRepo
    do
      dirBackup=".$param.bck/`echo $dirRepo | cut -d"/" -f2-`"
      if test -f "$dirBackup" && ! test -z "`diff "$dirRepo" "$dirBackup"`";then
	    echo " ./`echo $dirRepo| cut -d"/" -f2-`"
      fi
    done
#   stampo a video i files non presenti nella cartella di backup
    echo -e "\nFiles e cartelle mancanti: "
  find "$param" |sort |while read dirRepo
    do
      dirBackup="."$param".bck/`echo $dirRepo | cut -d"/" -f2-`"
      if ! test -e "$dirBackup" && [ "$dirRepo" != "$param" ];then
	echo " ./`echo $dirRepo| cut -d"/" -f2-`"
      fi
    done
fi
