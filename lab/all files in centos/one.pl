#!/bin/perl

#warning
use strict;
use warnings;

#load file
my $loadfile = $ARGV[0];
#open file 
open (my $LOG, "<", $loadfile) or die "can't open " . $loadfile;
open (my $INFO, ">", "hourlyInfo") or die "can't open hourlyInfo";


my $time;
my $prev_time = "o.o";
my $rejects = 0;
my $quarantines = 0;
#load all data
while (my $line = <$LOG>) {

    #replace line with : to represent data
	if ($line =~ /^(.*?):(\S+):/) {
		my $hour = $1;
		my $minute = $2;
		$time = $hour . ":" . $minute;
		if ($time eq $prev_time) {
			if (index($line, "reject") != -1) {
				++$rejects;

			}
			if (index($line, "quarantine") != -1) {
				++$quarantines;
			}
		}
		else {
            #if reach end
			if ($prev_time ne "o.o")
			{
				print $INFO $prev_time . "[postfix rejects:" . 
				$rejects . "] [amavis quarantines:" .
				$quarantines . "]\n";
			}
			$rejects = 0;
			$quarantines = 0;
		}
		$prev_time = $time;
	}
}
	print $INFO $prev_time . "[postfix rejects:" . 
				$rejects . "] [amavis quarantines:" .
				$quarantines . "]\n";

close $LOG;
close $INFO;