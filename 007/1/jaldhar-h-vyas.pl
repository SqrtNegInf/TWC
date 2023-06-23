#!/usr/bin/env perl
use v5.36;

say 0;

for my $number (1 .. 50) {
    my $total = 0;
    for my $digit (split //, $number) {
        $total += $digit;
    }

    if ($number % $total == 0) {
        say $number;
    }
}

