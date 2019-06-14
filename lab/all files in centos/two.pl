#!/bin/perl
use warnings;
use List::Util 'sum';

#open file
my $loadfile = "log2";
open ($log, "<", $loadfile) or die("Cannot open file " . $loadfile);

my %known;
my %unknown;
while (my $line = <$log>){
  if ($line =~ / connect from (.*?)\[(\S+\.\S+\.\S+\.\S+)\]/)
  {
    my $status = $1;
	my $ip = $2;
    #count ips
	if (index($status ,"unknown") != -1){
      if (!exists $unknown{$ip}) { 
	  	$unknown{$ip} = 1; 
	  }
      else  { 
	  	$unknown{$ip} = $unknown{$ip}+1; 
	  }
    }
	else{
      if (!exists $known{$ip}) { 
	  	$known{$ip} = 1; 
	  }
      else  { 
	  	$known{$ip} = $known{$ip}+1; 
	  }
    }

  }
}

#sum number of values 
$k_sum = sum values %known;
$max_known_ip = ((sort { $known{$b} <=> $known{$a} } keys %known)[0]);
print "Total Known connection: " . $k_sum . " – [" . $max_known_ip . "] accounts for " . $known{$max_known_ip} . " connections\n";

$u_sum = sum values %unknown;
$max_unknown_ip = ((sort { $unknown{$b} <=> $unknown{$a} } keys %unknown)[0]);
print "Total Unknown connection: " . $u_sum . " – [" . $max_unknown_ip . "] accounts for " . $unknown{$max_unknown_ip} . " connections\n";

close $log;