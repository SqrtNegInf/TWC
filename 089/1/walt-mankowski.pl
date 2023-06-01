#!/usr/bin/env perl
use v5.36;

sub gcd($a, $b) {
    return $b == 0 ? $a : gcd($b, $a % $b);
}

my $n = 100;
my $sum = 0;
for my $i (1..$n-1) {
    for my $j ($i+1..$n) {
        $sum += gcd($j, $i);
    }
}

say $sum;
