#!/bin/bash


##local file location and log file location
file_path="/media/sf_virtualbox_shared/hello.txt"

save_path="/media/sf_virtualbox_shared/uptime.log"


##formating
thedate="$(date +'%m-%d-%y')" 

thetime="$(date +'%H:%M:%S')"

thefile="- File \"full/path/to/lab2-test\""



##if the file exist
if [ -f $file_path ]
then 
	##if the log file exist
	if [ -f $save_path ]
	then
		##search for the last word in the last log 
		answer=$(tail -n 1 ${save_path} | awk '{print $NF}')
		#if the file was lost
		if [ "$answer" != "found" ]
		then 
			echo -e "${thedate} ${thetime} ${thefile} has been found"  >> ${save_path}
		fi
	##if the log file doesn't exist
	else 
		
		echo -e "${thedate} ${thetime} ${thefile} has been found"  >> ${save_path}
	fi
else 
	
	##if the log file exist
	if [ -f $save_path ]
	then
		
		answer=$(tail -n 1 ${save_path} | awk '{print $NF}')
		#if the file was found
		if [ "$answer" == "found" ]
		then 
			echo -e "${thedate} ${thetime} ${thefile} has been lost" >> ${save_path}
		fi
	#if the log file doesn't exist
	else
		
		echo -e "${thedate} ${thetime} ${thefile} has been lost" >> ${save_path}
	fi
fi




