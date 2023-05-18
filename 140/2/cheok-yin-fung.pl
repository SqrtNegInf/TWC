#!/usr/bin/env perl
use v5.36;

use Test::More tests => 3;

my ($i,$j,$k) = (2, 3, 4); #($ARGV[0], $ARGV[1], $ARGV[2]);

say table2array($i,$j,$k) if defined($ARGV[2]);



sub table2array {
    my ($i,$j,$k) = ($_[0], $_[1], $_[2]);

    die "k value too large \n" unless $i*$j >= $k;

    my @_arr;

    for my $_i (1..$i) {
        for my $_j (1..$j) {
            push @_arr, $_i*$_j;
        }
    }

    my @arr = sort {$a<=>$b} @_arr;

    return $arr[$k-1];
}

ok table2array(2, 3, 4) == 3;
ok table2array(3, 3, 6) == 4;
ok table2array(9, 8, 71) == 64;

