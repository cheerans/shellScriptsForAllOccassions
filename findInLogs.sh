#!/bin/sh

display_usage() { 
	echo "\n This script can be run to search log files, by selecting an option - for common search phrases" 
	echo -e "\n Usage:- Pass as argument common search word option :\n\n\t.) Exception\n\t.) error\n\t.) shutdown\n\n\t    eg:) findInLogfiles 1" 
	echo -e "\n If you pass a w, you can pass the search phrase itself!!! \n\n\t    eg:) findInLogfiles w SpecialWord"
}

SEARCH_OPTS=$1


	case $SEARCH_OPTS in
      		1)  SEARCH_PATTERN="Exception";;
      		2)  SEARCH_PATTERN="error";;
      		3)  SEARCH_PATTERN="shutdown";;
      		4)  SEARCH_PATTERN="sdgf";;
      		5)  SEARCH_PATTERN="SDSA";;
		w)  SEARCH_PATTERN=$2;;
	esac

LOG_DIRECTORY=../logs
cd $LOG_DIRECTORY
FILE_PATTERN=*.log

find . -name $FILE_PATTERN -exec grep -i $SEARCH_PATTERN {} \; -print
