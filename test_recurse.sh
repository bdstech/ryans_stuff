#!/bin/bash

recurse()
{
	SUBDIRS=`ls -p $2$1 | grep /`
	if [ SUBDIRS ]
	then
		for I in ${SUBDIRS}; do
			recurse $I $2$1
		done
		FILES=`ls $2$1* 2>&1 | grep -v "No such"`
		for F in ${FILES}; do
			echo  $F
			
		done
	fi
}

DIRS=`ls -p | grep /`

for i in ${DIRS}; do
	recurse $i "`pwd`/" 
done