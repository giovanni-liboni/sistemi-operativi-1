#!/bin/bash
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
