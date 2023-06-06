#!/usr/bin/env perl
use v5.36;

use List::Util qw /min/;

my @out;
my @A = (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
my $S = 3;

for my $i (2 .. scalar(@A) - 1) {
	push @out, min $A[$i], $A[$i - 1], $A[$i - 2];
}

say '(' . (join ', ', @out) . ')';
