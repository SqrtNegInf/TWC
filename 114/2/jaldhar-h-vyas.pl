#!/usr/bin/env perl
use 5.020;
use warnings;

my $N = shift // 12;
my $rightmostOneBit = $N & -$N;
my $nextHigherOneBit = $N + $rightmostOneBit;
my $rightOnesSequence = $N ^ $nextHigherOneBit;

$rightOnesSequence /= $rightmostOneBit;
$rightOnesSequence >>= 2;

say $nextHigherOneBit | $rightOnesSequence;
