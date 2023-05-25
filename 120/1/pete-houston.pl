#!/usr/bin/env perl
use v5.36;

my $n        = shift // 101;
my %masks    = ( even => 0b10101010, odd => 0b01010101 );
my $swapped  = ($n & $masks{even}) / 2 + ($n & $masks{odd}) * 2;

print "$swapped\n";
