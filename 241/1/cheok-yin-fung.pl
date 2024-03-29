#!/usr/bin/env perl
use v5.36;

sub at {
    my @nums = $_[0]->@*;
    my $diff = $_[1];
    my $result = 0;
    for my $i (0..$#nums-2) {
        my $numsj = $nums[$i]+$diff;
        my $numsk = $numsj+$diff;
        $result++ if 
            (grep /^$numsj$/, @nums)
                && 
            (grep /^$numsk$/, @nums);
    }
    return $result;
}

use Test::More tests=>2;
ok at([0, 1, 4, 6, 7, 10], 3) == 2;
ok at([4, 5, 6, 7, 8, 9], 2) == 2;
