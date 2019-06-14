#!/bin/bash

##this program will print the ip, netmask, device 

gateway=$(ip route | grep default | awk '{print $3}')

netmask=$(ifconfig | grep netmask | awk '{if(NR==1) print $4}')

device=$(ip route | grep default | awk '{print $5}')

echo "gateway: ${gateway} netmask: ${netmask} device: ${device}"

