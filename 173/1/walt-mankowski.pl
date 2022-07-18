#!/usr/bin/env perl
use v5.36;

sub is_esthetic($n) {
    my @d = split //, $n;
    for my $i (1..$#d) {
        return 0 unless abs($d[$i-1] - $d[$i]) == 1;
    }
    return 1;
}

my $n = 5456;
printf "%d is%s an esthetic number\n", $n, is_esthetic($n) ? "" : " not";
