#!/bin/bash

##this script print the addresses in the network, addresses that can be used and ntmask
##this program takes input of bits network

bhost=$((32-$@))
addresses=$((2**$bhost))
usable=$((${addresses}-2))
first=0
second=0
third=0
fourth=0
if [ $@ -gt 8 ]
then
	first=255
	if [ $@ -gt 16 ]
	then
		second=255
		if [ $@ -gt 24 ]
		then
			third=255

			if [ $@ -gt 32 ]
			then
				fourth=255
			else
				remain=$((255-(2**(32-$@)-1)))
				fourth=${remain}
			fi
		else
			remain=$((255-(2**(24-$@)-1)))
			third=${remain}
		fi
	else
		remain=$((255-(2**(16-$@)-1)))
		second=${remain}
	fi
else
	remain=$((255-(2**(8-$@)-1)))
	first=${remain}
fi

#echo $number
#echo $use

echo "addresses: ${addresses} usable: ${usable} netmask: ${first}.${second}.${third}.${fourth}"
