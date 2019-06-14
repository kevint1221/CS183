#!/bin/bash

#set variable
gid1=$(cat /etc/passwd | awk -F: '{print $4}')  
uid=$(cat /etc/passwd | awk -F: '{print $3}')  
login=$(cat /etc/passwd | awk -F: '{print $1}')  
group=$(cat /etc/group | awk -F: '{print $1}')
gid2=$(cat /etc/group | awk -F: '{print $3}')

#set variable into array
auid=(${uid})	 
alogin=(${login})
agroup=(${group})
agid2=(${gid2})
agid1=(${gid1})

#counter
i=0 #each unit
j=0 #each gid2
k=0
z=0
for user in $login
do
##print pass
	echo -n "${user} "
	echo -n "${auid[i]} "
	
	while [ ${agid1[i]} != ${agid2[j]} ]
	do
		j=$((j + 1))
	done
	#print matched gid group
	echo "${agroup[j]}"
	j=0		
	i=$((i +1)) 
done




