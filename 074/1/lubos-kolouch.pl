#!/usr/bin/env perl
use v5.36;

sub get_majority_element {
    my $arr = shift;

    my %counts;
    my $arr_size_half = scalar @$arr / 2;

    for (@$arr) {
        $counts{$_}++;
        return $_ if $counts{$_} > $arr_size_half;
    }

    return -1;
}

use Test::More;

is( get_majority_element( [ 1, 2, 2, 3, 2, 4, 2 ] ), 2 );
is( get_majority_element( [ 1, 3, 1, 2, 4, 5 ] ), -1 );

done_testing;
