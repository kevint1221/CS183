#!/bin/python
import sys

#read file in python
#python hw1.py filename filename2

for i in range(1, len(sys.argv)):
	f = open(sys.argv[i], 'r')
	print(f.read())
	f.close()



