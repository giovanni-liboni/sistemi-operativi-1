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
