#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

use Test::More;
use Test::Deep;

cmp_deeply ([map {chowlaNumber($_)} 1 .. 20],
            [0,0,0,2,0,5,0,6,3,7,0,15,0,9,8,14,0,20,0,21]);

done_testing;

sub chowlaNumber {
    my ($n) = @_;

    my @devisors = grep { $n % $_ == 0} 2 .. int($n/2);

    return sum0(@devisors);
}

