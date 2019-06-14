#!/bin/perl

use List::Util 'sum';
my $blockcount=0;
my %ip_count;
my %from;
my %two;
my $loadfile="log4";
open(my $LOG, "<", $loadfile) or die "cannot open" . $loadfile;

while(<$LOG>)
{
    #replace with data we want
	if ($_ =~ /Client host \[(\S+\.\S+\.\S+\.\S+)\] blocked using dnsbl\.sorbs\.net/)
	{
        #count 
		my $ip = $1;
		$blockcount++;
		if (!exists $ip_count{$ip})
		{
			$ip_count{$ip}++;
		}
			
		if ($_ =~ /from\=\<(\S+)\>/)
		{
			my $email = $1;
			if( !exists $from{$email})
			{
				$from{$email}++;
			}
		}
		if ($_ =~ /to\=\<(\S+)\>/)
		{
			my $email1 = $1;
			if( !exists $to{$email1})
			{
				$to{$email1}++;
			}
	}		
	}
}
print $blockcount. " messages rejected\n";
$ip_sum = sum values %ip_count;
print $ip_sum . " unique IP's\n";
$tosum = sum values %to;
$fromsum = sum values %from;
print $fromsum . " unique from addresses\n";
print $tosum . " unique to addresses\n";
close($LOG);