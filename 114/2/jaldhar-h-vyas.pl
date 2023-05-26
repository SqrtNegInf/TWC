#!/usr/bin/env perl
use v5.36;

my $N = shift // 12;
my $rightmostOneBit = $N & -$N;
my $nextHigherOneBit = $N + $rightmostOneBit;
my $rightOnesSequence = $N ^ $nextHigherOneBit;

$rightOnesSequence /= $rightmostOneBit;
$rightOnesSequence >>= 2;

say $nextHigherOneBit | $rightOnesSequence;
