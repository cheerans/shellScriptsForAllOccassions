#!/bin/sh


fileNames=( 'libs/a.jar' )
fileNames+=( 'conf/common/b.xml' )



srcBase='/usr/myapp/untar/scheeran/apps'
destBase='/usr/myapp/apps'

echo "\n"
echo "Starting ... \n"
echo "Copying folowing files from $srcBase to $destBase \n"

for ((iCur=0; iCur<${#fileNames[*]}; iCur++));do

  fname=`basename ${fileNames[iCur]}`
  echo "* $fname"
  destFileName="$destBase${fileNames[iCur]}.$(date +"%Y%m%d.%H.%p")"
  if [ -f "$destFileName" ]
  then
    echo "  > *** Not backing up, file already exists ***"
  else
      echo "  > Backing up file"
      mv "$destBase${fileNames[iCur]}" $destFileName
  fi
  echo "  > Copying file"
  cp -p "$srcBase${fileNames[iCur]}" "$destBase${fileNames[iCur]}"
done
