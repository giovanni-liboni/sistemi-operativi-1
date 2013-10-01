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
echo
# inizializzo la variabile dir con il nome della directory in cui cercare
# il file da eliminare
dir=$1
# trasformo i parametri passati in un'unica stringa
file=`echo $@ | cut -d" " -f2-`

# estraggo i singoli path delle corrispondenze trovate
echo -e "Nella cartella $dir: "

# test per stampare "Nessun file trovato" se find non ritorna nulla
if test -z "`find ./$dir -type f -name "$file"`";then
   echo "Nessun file trovato" 
fi
find ./$dir -type f -name "$file" | while read data
do

#     elimino il file con l'opzione -f per non chiedere all'utente nulla
    rm -f "$data"
    echo -e "File eliminato: $data"
done

echo -e "\nNella cartella di backup di $dir: "
# test per stampare "Nessun file trovato" se find non ritorna nulla
if test -z "`find ./.$dir.bck -type f -name "$file"`";then
   echo "Nessun file trovato" 
fi
find ./.$dir.bck -type f -name "$file" | while read data
do

#   elimino il file con l'opzione -f per non chiedere all'utente nulla
    rm -f "$data"
    echo -e "File eliminato: $data"
done
