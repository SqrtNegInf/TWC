#!/usr/bin/env perl
use v5.36;

sub log2 {
    my ($n) = @_;

    return log($n) / log(2);
}

sub gcd {
    my ($a, $b) = @_;

    return 0 == $b ? $a : gcd($b, $a % $b);
}

my ($m, $n) = (8,  24);

my $x = log2(gcd($m, $n));
say  $x == int($x) ? 1 : 0;
