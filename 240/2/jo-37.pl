#!/usr/bin/env perl
use v5.36;


use Test2::V0 -srand => 1;

our ($tests, $examples) = (1,1);

run_tests() if $tests || $examples;	# does not return

die <<EOS unless @ARGV;
usage: $0 [-examples] [-tests] [P...]

-examples
    run the examples from the challenge
 
-tests
    run some tests

P...
    permutation of (0..N-1)

EOS


### Input and Output

say "(@{build_array(@ARGV)})";


### Implementation

# Slice the array with itself.

sub build_array {
    [@_[@_]];
}


### Examples and tests

sub run_tests {
    SKIP: {
        skip "examples" unless $examples;
        is build_array(0, 2, 1, 5, 3, 4), [0, 1, 2, 4, 5, 3], 'example 1';
        is build_array(5, 0, 1, 2, 3, 4), [4, 5, 0, 1, 2, 3], 'example 2';
    }

    SKIP: {
        skip "tests" unless $tests;
	}

    done_testing;
    exit;
}
