#!/usr/bin/env perl
use v5.36;

sub is_isomorphic {
    my $what = shift;

    my %char_map;

    my @arr1 = split //, $what->{'first'};
    my @arr2 = split //, $what->{'second'};

    for my $i (0..scalar @arr1-1) {
        $char_map{$arr2[$i]} //= $arr1[$i];
        $char_map{$arr1[$i]} //= $arr2[$i];

        return 0 unless $char_map{$arr1[$i]} eq $arr2[$i];
        return 0 unless $char_map{$arr2[$i]} eq $arr1[$i];
    }

    return 1;
}

use Test::More;

is(is_isomorphic({first => 'abc', second => 'xyz'}), 1);
is(is_isomorphic({first => 'abb', second => 'xyy'}), 1);
is(is_isomorphic({first => 'sum', second => 'add'}), 0);

done_testing;
