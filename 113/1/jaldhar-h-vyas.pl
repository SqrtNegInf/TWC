#!/usr/bin/env perl
use 5.020;
use warnings;

my ($N, $D) = (24,7);

my $total = 0;
for my $i (grep { /$D/ } (1 .. $N)) {
    $total += $i;
}

say 0 + ($total == $N) ? '1' : '0';
