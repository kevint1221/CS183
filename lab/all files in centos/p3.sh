#!/bin/bash

#read value from user
#echo "enter a value"
#read userinput
#echo " you just enter ${userinput}"

#let user creste filename
#echo "enter filename"
#read filename
#touch "$filename.txt"

#echo -n "helo" echo  "hello"

for i in $@
do
	cat $i
done

