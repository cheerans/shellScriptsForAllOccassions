#!/bin/bash

display_usage() { 
	echo "This script can be run to restart a service, by selecting an option" 
	echo -e "\nUsage - Pass as argument Service Name option:\n.) asvc\n.) bsvc\n.) csvc\n.) dsvc\n" 
	echo -e "\n\n if you pass an l, you can just list processes"
} 


killProcess() { 

	svcname=$1
	KILLED_PROCESS=$(ps auxww | grep -v ksh | grep -v sh | grep fact | grep java | grep $svcname| awk '{print $2}')
	echo "killing " $KILLED_PROCESS
	kill $KILLED_PROCESS
	echo -n "Wait till the process is done ..."
	while ps -p "$KILLED_PROCESS" > /dev/null 2>&1; do
		sleep 1
		WAIT_LOOP=$((WAIT_LOOP+1))
		if [ "$WAIT_LOOP" = "60" ]; then
			break
		fi
		echo -n "."
	done
	echo ""
	echo "Killed the process for "$servicename
}

listProcess() {

	svcname=$1
	LIST_PROCESS=$(ps auxww | grep -v ksh | grep -v sh | grep fact | grep java | grep $svcname| awk '{print $2}')
	echo "\nProcesses are " $LIST_PROCESS "\n"
	pidArr=(${LIST_PROCESS//b/ })
	for pid in "${pidArr[@]}"
	do
   		echo $(ps auxww  $pid)"\n"

	done
	
}

restartService() { 
	
	svcname=$1

	BASEPATH=
	BASELOGPATH=
	PROFILESTR=spring.profiles.active=dev

	cd $BASEPATH


	case $svcname in
		asvc)
			killProcess  $svcname
			nohup  java -Xmx1024m -D$PROFILESTR -jar asvc.jar >  $BASELOGPATH/asvc.log 2>&1 &
			echo "Restarted "$svcname
			;;
		bsvc)
			killProcess  $svcname
			nohup  java -Xmx1024m -D$PROFILESTR -jar bsvc.jar >  $BASELOGPATH/bsvc.log 2>&1 &
			echo "Restarted "$svcname
			;;
		csvc)
			killProcess  $svcname
			nohup  java -Xmx1024m -D$PROFILESTR -jar csvc.jar >  $BASELOGPATH/csvc.log 2>&1 &
			echo "Restarted "$svcname
			;;
		dsvc)
			killProcess  $svcname
			nohup  java -Xmx1024m -D$PROFILESTR -jar dsvc.jar >  $BASELOGPATH/dsvc.log 2>&1 &
			echo "Restarted "$svcname
			;;
		*)
			display_usage
			exit 1
			;;
	esac
}

# if less than 1 arguments supplied, display usage 
if [  $# -le 0 ] 
then 
	display_usage
	exit 1
fi 


servicename=$1

option=$2

listProcess $servicename

if [[ $option != "l" ]]
then
	restartService $servicename
fi





