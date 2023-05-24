#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'factor';
use List::Util 'any';

my ($n, $i, $j) = (150, 0, 0);
do {
	$i++ unless any { $_ != 2 && $_ != 3 && $_ != 5 } factor (++$j);
} until $i == $n;

print "$j\n";
