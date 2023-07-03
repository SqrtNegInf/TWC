#!/usr/bin/env raku

use Test;

my @Test =
    1,         0,
    2,         1,
    3,         2,
    4,         2,
    5,         3,
    6,         3,
    7,         4,
    8,         4,
    9,         4,
    10,        4,
    20,        8,
    113,      30,       
    225,      48, 
    271,      58,
    684,     124,
    499,      95,
    502,      95,
    503,      96,
    504,      96,
;
plan @Test ÷ 2;

constant @prime = lazy (2,3,*+2 ... ∞).grep: *.is-prime;

sub count-of-primes-lte( $n --> Int) { @prime.first( * > $n, :k); }

for @Test -> $in, $exp {
    is count-of-primes-lte( $in), $exp, "$exp primes ≤ $in";
}
done-testing;

my $n = 499;
say "\nInput: \$n = $n\nOutput: ", count-of-primes-lte( $n);

exit;

