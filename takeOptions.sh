#/bin/ksh

# Use env file
CURR_DIR=`dirname $0`
. $CURR_DIR/env.sh

DEBUG=false

while getopts e:d:p:t:f:x opt
do
    case "$opt" in
      e)  INSTANCE="$OPTARG";;
      d)  DATE="$OPTARG";;
      p)  PROCESS="$OPTARG";;
      t)  BATCH_TYPE="$OPTARG";;
      f)  FREQUENCY="$OPTARG";;
      x)  DEBUG=true;;
    esac
done

if [ -z "$INSTANCE" ] || [ -z "$PROCESS" ] || [ -z "$BATCH_TYPE" ] || [ -z "$FREQUENCY" ] 
then
   echo "usage: $0 -e [uat|prod] -p [process] -t MINI -f daily [-d YYYYMMDD] [-x]..."
   exit 1
fi
