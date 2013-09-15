#!/bin/bash
echo
# mi sposto nella cartella di destinazione
cd ./$1

# trasformo i parametri passati in un'unica variabile
# da passare come pattern di ricerca al find
pattern=`echo $@ | cut -d" " -f2-`

# cerco nelle sottodirectory ricorsivamente (-R)
# elenco solo i file (-l) e non tutte le corrispondenze
# cerco solo i pattern corrispondenti (-w)

# ricavo il nome del file e trascuro il path
for files in `grep -Rlw -e "$pattern" ./`
do
  temp1=`basename $files`
  temp=`echo $temp $temp1`
done

# ordino i files in ordine alfabetico
a=`for files in $temp;do echo "$files"; done | sort -u`

# cerco e stampo i file in ordine alfabetico
for files in $a
do
  find ./ -type f -name "$files"
done