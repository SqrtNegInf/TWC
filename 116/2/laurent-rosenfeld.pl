#!/usr/bin/env perl
use v5.36;

sub sum_squares {
    my $n = shift;
    my $sum_sq = 0; $sum_sq += $_ ** 2 for split //, $n;
    my $sqrt_int = int sqrt $sum_sq;
    return $sqrt_int ** 2 == $sum_sq ? 1 : 0;
}
say "$_: ", sum_squares $_ for 33,34,35,50
