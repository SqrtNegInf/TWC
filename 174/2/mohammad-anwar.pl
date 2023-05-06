#!/usr/bin/env perl
use v5.36;
use Test2::V0 -srand => 1;
use Algorithm::Combinatorics qw(permutations);

is permutation2rank([1, 0, 2]),
   [ [0, 1, 2],
     [0, 2, 1],
     [1, 0, 2],
     [1, 2, 0],
     [2, 0, 1],
     [2, 1, 0],
   ];

is rank2permutation([0, 1, 2], 1),
   [0, 2, 1];

done_testing;

#
#
# METHODS

sub permutation2rank($array) {
    return [ permutations([sort @$array]) ];
}

sub rank2permutation($array, $rank) {
    return ( @{permutation2rank($array)} )[$rank];
}
