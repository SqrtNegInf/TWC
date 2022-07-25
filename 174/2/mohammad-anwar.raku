#!/usr/bin/env raku

use Test;

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

done-testing;

#
#
# METHODS

sub permutation2rank($array) {
    return [ $array.sort.permutations ];
}

sub rank2permutation($array, $rank) {
    return @(permutation2rank($array)).[$rank];
}
