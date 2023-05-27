#!/usr/bin/env perl
use v5.36;

use Math::Combinatorics;
use List::Util 'sum';

sub nums_containing {
    my($n, $d) = @_;
    my @nums;
    for (1..$n) {
        push @nums, $_ if /$d/;
    }
    return @nums;
}

sub represent {
    my($n, $d) = @_;
    my @nums = nums_containing($n, $d);
    for my $k (1 .. @nums) {
        for my $combin (combine($k, @nums)) {
            return 1 if sum(@$combin) == $n;
        }
    }
    return 0;
}


my($N, $D) = (24, 7);
say represent($N, $D) ? 1 : 0;
