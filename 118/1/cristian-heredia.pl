#!/usr/bin/env perl

use warnings;
use strict;
#use Data::Dumper;
    
my $N = 5;


my @bits = split(//, sprintf ("%b", $N));
my $j = @bits - 1;

foreach (my $i=0; $i<@bits; $i++){
    if ($bits[$i] != $bits[$j]){
        print "Output: 0\n";
        exit
    }
    $j -= 1;
}

print "Output: 1\n";
