#!/usr/bin/env perl
use v5.36.0;

use List::Util 'sum';

my @array = (1,2,3,4);
#@array = (0,2,1,3);

print "Input: @array\n";
print "Max sum: ", maxminsum(@array), "\n";

sub maxminsum { sum( (sort{$a<=>$b}@_)[map 2*$_,0..$#_/2] ) }
