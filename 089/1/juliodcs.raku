#!/usr/bin/env raku

sub gcd-sum($n) {
    (1 .. $n).combinations(2).map({[gcd] @^it}).sum
}

######## MAIN and TESTS ########

use Test;

is gcd-sum(3), 3, 'gcd-sum of 3';
is gcd-sum(4), 7, 'gcd-sum of 4';
is gcd-sum(100), 13015, 'gcd-sum of 100';

done-testing;
