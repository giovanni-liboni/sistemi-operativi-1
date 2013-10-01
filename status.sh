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
