#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

is five_number_summary(0,0,1,2,63,61,27,13), [0,0.5,7.5,44,63];

done_testing;

#
#
# METHODS

sub median(@n) {
    return $n[(@n-1)/2] if @n % 2;
    return ($n[(@n/2)-1] + $n[@n/2]) / 2;
}

sub five_number_summary(@n) {
    @n = sort { $a <=> $b } @n;

    my $min = $n[0];
    my $max = $n[-1];
    my $med = median @n;
    my $q1  = median grep { $_ < $med } @n;
    my $q3  = median grep { $_ > $med } @n;

    return [ $min, $q1, $med, $q3, $max ];
}
