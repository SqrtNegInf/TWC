#!/usr/bin/env perl
use v5.36;

my @fac = 1; # Factorials (0! = 1 by definition)
my @lf;      # Left Factorials

for my $i (1 .. 10) {
	push @fac, $fac[$i-1] * $i;
	push @lf, ($lf[-1] // 0) + $fac[$i-1];
}

say join ', ', @lf;
