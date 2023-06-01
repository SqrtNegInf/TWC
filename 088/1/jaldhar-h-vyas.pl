#!/usr/bin/env perl
use v5.36;

my @N = <5 2 1 4 3>;

my $sum = 1;
for my $e (@N) {
    $sum *= $e;
}

my @M = map { $sum / $N[$_] } 0 .. scalar @N - 1;

say join q{, }, @M;
