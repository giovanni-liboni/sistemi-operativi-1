#!/bin/bash 
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
