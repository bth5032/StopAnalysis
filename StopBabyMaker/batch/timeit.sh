#!/bin/bash

# This script calls batch.sh and then keeps checking condor_q for files
# until there are no more files submitted by the user.

echo "Unix time at start: " `date +%s`
. batch.sh

while [ 1 ]
do
	if [[ $(condor_q | grep `whoami`) == "" ]]
		break
done 

echo "Time at finish: " `date +%s`

