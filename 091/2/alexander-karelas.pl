#!/usr/bin/env perl
use v5.36;

my @N = (2, 1, 1, 0, 2);

my $pos = 0;

while ($pos < $#N and $N[$pos] != 0) {
    $pos += $N[$pos];
}

say int($pos == $#N);
