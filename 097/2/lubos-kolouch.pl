#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;

sub binary_substrings {
    my $what = shift;

    my $inp_bin = $what->[0];
    my $split_nr = $what->[1];


    # count 0s and 1s at each position

    my %counts;
    
    my $pos = 0;
    for (split '', $inp_bin) {
        $counts{$pos}{$_}++;
        $pos++;
        $pos = $pos % $split_nr;
    }

    # if both positions exist, count the smaller one
    my $flips = 0;

    for my $key (keys %counts) {
        $flips += min(values %{$counts{$key}}) if (defined $counts{$key}{'0'}) and (defined $counts{$key}{'1'});
    }

    return $flips;
}

use Test::More;

is(binary_substrings(['101100101', 3]), 1);
is(binary_substrings(['10110111', 4]), 2);
done_testing;
