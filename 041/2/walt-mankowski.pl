#!/usr/bin/env perl
use v5.36;

my $N = 20;
my ($l1, $l2) = (1, 1);

for my $i (0..$N-1) {
    if ($i < 2) {
        say "L($i) = 1";
    } else {
        ($l1, $l2) = ($l2, $l1 + $l2 + 1);
        say "L($i) = $l2";
    }
}

