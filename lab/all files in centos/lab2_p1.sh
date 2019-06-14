#!/bin/bash

##lab2_part1
##show word counts "magic" in the kernel directory

grep -ir --include=*.h "magic" /usr/src/kernels/ | wc -l

