#!/bin/perl

#print file content using perl
#perl hw1.pl filename filename2
foreach (@ARGV)
{
	open(FILE, $_);
	print<FILE>;
	
	close(FILE);
}
