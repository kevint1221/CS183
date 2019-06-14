#!/bin/perl

use strict; 
use warnings; 
my $loadsize = 0; 

    

$loadsize = $#ARGV;
#pop lie that contain the argument 
for ( my $i = 0; $i < $loadsize; $i++)
{
    pop @ARGV;
}

     