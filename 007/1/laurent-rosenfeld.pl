#!/usr/bin/env perl
use v5.36;

for my $num(1..50) {
    my $sum = 0;
    for (split //, $num) {
        $sum += $_;
    }
    say $num if $num % $sum == 0;
}
