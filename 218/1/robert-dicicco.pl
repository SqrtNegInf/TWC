#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use Algorithm::Combinatorics qw(permutations combinations);

my @lists = ([3, 1, 2],[4, 1, 3, 2],[-1, 0, 1, 3, 1],[-8, 2, -9, 0, -4, 3]);

my $maxval = 0;

my $threelist = 0;

for my $lst (@lists) {
    say "Input: \@list = [@$lst]";
    my $iter = combinations($lst, 3);
    while (my $c = $iter->next) {
            my $threeval = @{$c}[0] * @{$c}[1] * @{$c}[2];
            if ($threeval > $maxval) {
                $maxval = $threeval;
                $threelist = $c;
            }
    }
    say "Output: $maxval";
    my @sorted = sort(@{$threelist});
    say "$sorted[0] x $sorted[1] x $sorted[2] = ",$maxval;
    $maxval = 0;
    $threelist = 0;
    say "";
}
