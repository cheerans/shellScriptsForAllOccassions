#!/bin/sh

FILE_PATTERN=$1
SEARCH_PATTERN=$2
find . -name $FILE_PATTERN -exec grep -i $SEARCH_PATTERN {} \; -print
