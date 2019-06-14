#!/bin/bash
clear
echo "this is the bash script"

##disable service: kdump, it is use for new kernel feature testing
systemctl disable kdump

##disable service: postfix, it is used for email delivery
systemctl disable postfix

##disable service: sshd, it is used for ssh remote
systemctl disable sshd

##mask service to prevent active the service by accident
systemctl mask kdump
systemctl mask postfix
systemctl mask sshd
