#!/bin/bash
#1
find /sbin /bin /usr/bin /usr/sbin -user root -perm -4000
#Setuid  or root allows non root user to execute file that normally need root permission
# 4 means has setuid permission, 2 means has setgid permission, 1 means stickybit can only modify file it created
read -p "Hit enter to continue to #2."
#2
find / -perm -4000 -or -perm -2000
read -p "Hit enter to continue to #3." 
#3
find /var -cmin -20
read -p "Hit enter to continue to #4."
#4
find /var -type f -size 0
read -p "Hit enter to continue to #5."
#5
find /dev -not -type f -and -not -type d -ls -printf %a
read -p "Hit enter to continue to #6."
#6
find /home -type d -not -user root -exec chmod 711 {} \;
read -p "Hit enter to continue to #7."
#7
find /home -type f -not -user root -exec chmod 755 {} \;
read -p "Hit enter to continue to #8."
#8
find /etc -ctime -5
