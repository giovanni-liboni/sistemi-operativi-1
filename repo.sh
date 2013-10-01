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
    #######################
    # da cancellare       #
    #######################
    temp=`echo $@`
    repobck=`echo .$temp.bck`
    mkdir -p ./"$temp"/prova/prova2.txt
    mkdir -p ./$repobck/prova/prova2.txt
    mkdir -p ./""$temp""/prova/
    mkdir -p ./""$temp""/prova/ciao
    mkdir -p ./""$temp""/prova/dsa
    mkdir -p ./""$temp""/prova/dsa_ciao/omar/matteo/ale/tastiera/mouse/solo
    
    echo ciao > ./""$temp""/prova/dsa_ciao/omar/matteo/ale/tastiera/mouse/solo/file1
    echo ciao come va come stai oggi? > ./""$temp""/prova/dsa_ciao/omar/matteo/ale/tastiera/mouse/solo/file
    echo maoaoasoo > ./""$temp""/prova/dsa_ciao/omar/matteo/ale/tastiera/mouse/file2
    
    echo ciao come va ciao mondo >./""$temp""/prova/prova.txt
    echo ciao come va ciao mondo >./""$temp""/prova/prova1.txt
    echo ciao come va >./""$temp""/prova.txt
    echo ciao come va > ./""$temp""/prova/dsa/dsa.txt
    echo ciao come va mi chiamo omar >> ./""$temp""/prova/prova.txt

    mkdir -p ./.""$temp"".bck/prova/
    mkdir -p ./.""$temp"".bck/prova/ciao
    mkdir -p ./.""$temp"".bck/prova/dsa_dsa
    
    echo ciao come va mi chiamo aldo>./.""$temp"".bck/prova/prova.txt
    echo ciao come va mi chiamo serena>./.""$temp"".bck/prova/prova1.txt
    echo ciao come va? > ./.""$temp"".bck/prova/ciao.txt
