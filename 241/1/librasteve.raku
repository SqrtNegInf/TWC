#!/usr/bin/env raku

use Data::Dump::Tree;
use Test;

my @tests = [
    %(
        nums => (0, 1, 4, 6, 7, 10),
        diff => 3,
    ),
    %(
        nums => (4, 5, 6, 7, 8, 9),
        diff => 2,
    ),
    %(
        nums => [5..7],
        diff => 1,
    ),
    %(
        nums => [5,7],
        diff => 1,
    ),
];

sub run( \nums, \diff) {

    sub check( \i, \j, \k ) {
        i < j < k                 &&    # always true 
        nums[j] - nums[i] == diff && 
        nums[k] - nums[j] == diff 
    }

    gather {
        for ^nums .combinations(3) {
            take @^a if check(|@^a)         # DH added @^a to take
        }
    }

}

say run(.<nums>, .<diff>) for @tests;
