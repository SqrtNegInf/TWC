#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;
use feature "say";

sub gcd {
        my ($i, $j) = sort { $a <=> $b } @_;
        while ($j) {
                ($i, $j) = ($j, $i % $j);
        }
        return $i;
}
my $n = 100;
my $sum = 0;
for my $i (1..$n) {
    for my $j ($i+1..$n) {
        $sum += gcd $i, $j;
    }
}
say $sum;
