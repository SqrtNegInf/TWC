#!/usr/bin/env perl
use v5.36;

my $total = 0;

while (scalar @ARGV > 1) {
    $total += shift . pop;
}

if (scalar @ARGV) {
    $total += $ARGV[0];
}

say $total;
