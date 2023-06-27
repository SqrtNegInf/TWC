#!/usr/bin/env perl
use v5.36;

die 'do not run';

package main;

use Math::Prime::Util qw/next_prime/;
use Math::Combinatorics;
use List::Util qw/sum/;

use Test::More;

# the tests fail most of the time as ->next_combination is returning the elements in unpredictable order
is_deeply( find_prime_partitions( 18, 2 ), [ [ 5, 13 ], [ 7, 11 ] ] );
is_deeply( find_prime_partitions( 19, 3 ), [ [ 3, 5, 11 ] ] );
done_testing;
1;
