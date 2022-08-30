#!/usr/bin/env perl5.32.1

#use v5.36;
use PDL;
use utf8;
binmode STDOUT, ':utf8';
my @blocks=split "", "▁▂▃▄▅▆▇█"; # Array of blocks of different heights
my $small=1e-7;
my $indices=pdl((15,2500,35,-4500,55,65,75,8500));	               # slurp data into ndarray
$indices-=$indices->min;	               # start at 0
$indices*=@blocks/($indices->max+$small);      # Normalize to 0..number of blocks-1
print join "", map {$blocks[$_]} $indices->list; # Use as indices into block array
print "\n";
