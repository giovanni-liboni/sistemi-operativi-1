
#!/bin/bash
while (true)
do
  clear
  echo -e "
  \t1. init-repo
  \t2. commit
  \t3. remove
  \t4. revert
  \t5. status
  \t6. file_search"
#   controllo se la directory di lavoro è stata impostata
  if ! test -z "$REPO";then
    echo -e "\n\tDirectory corrente: $REPO\n"
  fi
  echo -n ">> " 
  read opt param
  case $opt in
#   Funzione per la creazione del repository di backup
    init-repo | 1)
      if test -z "$param";then
	echo -e "\ninit-repo <repo>"
      else
	  ./init-repo.sh $param
	  case $? in 
	    1)REPO=$param;;
	    *);;
	  esac
      fi;;
#   Funzione per il commit
    commit | 2) 
      if test -z "$param";then
	echo -e "\ncommit <repo>"
      else
	./commit.sh $param
      fi;;
#   Funzione per la rimozione di un file
#   Magari passare intero array così da poter eliminare più file 
#   contemporaneamente
    remove | 3) 
      if test -z "$param";then
	echo -e "\nremove <file>"
      elif test -z "$REPO";then
	echo -e "\nImpostare un repository"
      else
	bash remove.sh $REPO $param
      fi;;
#   Funzione per il rispristino del backup
#   se viene passato un argomento allora rispristinerà solo quello
    revert | 4) 
      if test -z "$param";then
	echo -e "\nrevert <repo> [file]"
      else
	echo
	./revert.sh $param
      fi;;
#   Funzione per visualizzare i file differenti
#   dalla cartella d backup
    status | 5)
      if test -z "$param";then
	echo -e "\nstatus <repo>"
      else
	./status.sh $param
	echo $repo
      fi;;
#   Funzione per la ricerca del file
#   Viene passato l'array contenente il pattern di ricerca
    file_search | 6)
      if test -z "$param";then
	echo -e "\nfile_search <file>"
      elif test -z "$REPO";then
	echo -e "\nImpostare un repository"
      else
	bash file_search.sh $REPO $param
      fi;;
    exit | 7)
      exit;;
    *)
      echo -e "\nComando errato"
      ;;
  esac
  echo -e "\nPremere ENTER per continuare..."
  read x
done
