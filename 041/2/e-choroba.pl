#!/usr/bin/env perl
use v5.36;

my @last2 = (1, 1);
for my $n (0 .. 20) {
    say "L($n) = ", $last2[0];
    push @last2, $last2[0] + $last2[1] + 1;
    shift @last2;
}

