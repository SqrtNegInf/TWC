#!/usr/bin/env perl
use v5.36;

my ($n, $k) = (5,34);
die "Root ($n) must be more than 1\n" unless $n > 1;
die "Operand ($k) must be positive\n" unless $k > 0;
print $k ** (1 / $n) . "\n";
