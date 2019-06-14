#!/bin/perl
use List::Util 'sum';

my $loadfile = $ARGV[0];

open(my $LOG, "<", $loadfile) or die "can't open" . $loadfile;

my %from;
my %to;
while(my $line = <$LOG>)
{
    #counting
	if($line !~ /reject/)
	{
	if($line =~ /from\=\<(\S+)\>/)
	{
		my $email = $1;
			if(!exists $from{$email})
			{
				$from{$email} = 1;
			}
			else
			{
				$from{$email} = $from{$email}+ 1;
			}
	}
	if($line =~ /to\=\<(\S+)\>/)
	{
			my $email1 = $1;
			if(!exists $to{$email1})
			{
				$to{$email1} = 1;
			}
			else
			{
				$to{$email1} = $to{$email1} + 1;
			}
	}
	}

}


#top 5 from emails
#print top five 
$fromone = ((sort{ $from{$b} <=> $from{$a} } keys %from) [0]);
print "From " . $fromone . " " . $from{$fromone} . "\n";
$fromtwo = ((sort{ $from{$b} <=> $from{$a} } keys %from) [1]);
print "From " . $fromtwo . " " . $from{$fromtwo} . "\n";
$fromthree = ((sort{ $from{$b} <=> $from{$a} } keys %from) [2]);
print "From " . $fromthree . " " . $from{$fromthree} . "\n";
$fromfour = ((sort{ $from{$b} <=> $from{$a} } keys %from) [3]);
print "From " . $fromfour . " " . $from{$fromfour} . "\n";
$fromfive = ((sort{ $from{$b} <=> $from{$a} } keys %from) [4]);
print "From " . $fromfive . " " . $from{$fromfive} . "\n";


#top 5 to emails

$toone = ((sort{ $to{$b} <=> $to{$a} } keys %to) [0]);
print "To " . $toone . " " . $to{$toone} . "\n";
$totwo = ((sort{ $to{$b} <=> $to{$a} } keys %to) [1]);
print "To " . $totwo . " " . $to{$totwo} . "\n";
$tothree = ((sort{ $to{$b} <=> $to{$a} } keys %to) [2]);
print "To " . $tothree . " " . $to{$tothree} . "\n";
$tofour = ((sort{ $to{$b} <=> $to{$a} } keys %to) [3]);
print "To " . $tofour . " " . $to{$tofour} . "\n";
$tofive = ((sort{ $to{$b} <=> $to{$a} } keys %to) [4]);
print "To " . $tofive . " " . $to{$tofive} . "\n";

close $loadfile;