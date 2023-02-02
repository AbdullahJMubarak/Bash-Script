#!/bin/bash
DIRS=$1
DIRD=$2
SEC=$3
MAXBACKUPS=$4
START=$(date +%s)
ls -lr "$DIRS" > directory-info.last
cp -r  "$DIRS" "$DIRD"
while true;
do
	STATE1=$(stat -c %y "$1")
	sleep $SEC
	ls -lr "$1" > directory-info.new
	STATE2=$(stat -c %y "$1")
	if [[ "$STATE1" != "$STATE2" ]];
        then
                CURRENT_DATE=$(date "+%F-%H-%M-%S")
		cp -r "$1" "$2"/"$CURRENT_DATE"
		ls -lr "$1" > directory-info.last
         fi


	
	END=$(date +%s)
	DUR=$(( $END - $START ))
	if [[ DUR -gt 30 ]];
	then
		break;
	fi
done
COUNTS=0
for DIR in $(ls -t  $DIRD);
do

	COUNTS=$(( $COUNTS + 1 ))
	
	if [[ "$COUNTS" -gt "$MAXBACKUPS" ]];
	then
		rm -r $DIRD/$DIR


	fi
done
