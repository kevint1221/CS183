#!/bin/bash

#command 1
#dd can be used to copy file, transfer file, convert file, backup file, de/compress file

##convert test.txt into test3.txt all in uppercase
dd if=test.txt of=test3.txt conv=ucase ## if=input file  of = output file   conv= convertion function

read -p "Hit enter to continue to command find"

#command 2
##find is a filter that can easily output file you want

##find file type  that is regular file and has extension txt
find -type f -name "*.txt"

read -p "Hit enter to continue to command file"

#command 3
#file can be used to determine the type of files

##see the file type  under the current directory
file *

read -p "Hit enter to continue to command fuser"

#command 4
#fuser can see the process(PID) that is using the file, directories , or socket
#yum install psmisc

##see the process used in HOME
#the character after PID is the type of access
#c- current directory, r-root directory, f- open file
fuser -v /        #-v to see the name of process

read -p "Hit enter to continue to command grep"

#command 5
#grep can be used to search the file or content of a file very easily

#search file that contain the word hello ignore casesensitivity and do recursive for th sub file
# which has extension file txt in the current directory
grep -ir --include=*.txt "hello" .

read -p "Hit enter to continue to command host"

#command 6
#host can be used to find the ip address and mail of a DNS or vice versa
#yum install bind-utils

#find the ip address of linux-bible.com 
host linux-bible.com

read -p "Hit enter to continue to command ldd "

#command 7
#ldd can be used to find the dependencies for a shared library 

#find the dependecy of ls, what it needs to run command ls
ldd /bin/ls

read -p "Hit enter to continue to command lsof"

#command 8
#lsof can see the information about the file that is open by certain process

#see the information about bash
lsof /bin/bash

read -p "Hit enter to continue to command mount"

#command 9
#mount can be used to add external device or rom into the filesystem

#print the mounted that is type ext4

mount -t ext4

read -p "Hit enter to continue to command ps"


#command 10
# ps can see the current running processes

#see current running process
ps -aux

read -p "Hit enter to continue to command pkill"

#command 11
#pkill
#pkill can be used to kill certain process

#kill process of vi

pkill vi

read -p "Hit enter to continue to command netstat"

#command 12
#netstat can be use to display all the network connection , routing table etc

#display all the network connection
netstat -a

read -p "Hit enter to continue to command renice"

#command 13
#renice can be use to change scheduler priority on the process, even running process

#change nice value on the user ktsai017
renice -n 5 -u ktsai017

read -p "Hit enter to continue to command fuser"

#command 14
#resyc can be used to backup restore point through network
 
#copy file remotely
rsync -arv /media/test.txt ktsai017@bolt.cs.ucr.edu:/backup/

read -p "Hit enter to continue to command fuser"

#command 15
#time can be use to deterine how long a given command takes to run

#time how long it takes to execute the test.sh bash command
time ./test.sh

read -p "Hit enter to continue to command fuser"

#command 16
#ssh can be use to remotely control a server

#remotely control ktsai017
ssh ktsai017@bolt.cs.ucr.edu

read -p "Hit enter to continue to command fuser"

#command 17
#stat can we use to display detail status of a particular file such as size ,block , access time

#display the stautus of the file test.txt
stat test.txt 

read -p "Hit enter to continue to command fuser"

#command 18
#strace monitor the system call and signals of a program

#see the trae of ls execution
strace ls

read -p "Hit enter to continue to command fuser"

#command 19
#uname shows the kernel operating system you are using

#show kernel os
uname -s

read -p "Hit enter to continue to command fuser"

#command 20
#weget can be used to download file over network, it supports http ftp etc

wget http://website.com/files/file.zip


















