#!/usr/bin/env perl5.32.1

use v5.16;
use Test2::V0 '!float', -srand => 1234;
use PDL;
use experimental 'signatures';

our ($tests, $examples);

run_tests(); #if $tests || $examples;	# does not return


### Input and Output

say pefsmt(@ARGV);


### Implementation

# This task and task 2 from week 134 are very similar and so are the
# solutions.  Pick Element From Sorted Multiplication Table.
sub pefsmt ($i, $j, $k) {
    outer(sequence(long, $i) + 1, sequence(long, $j) + 1)
        ->flat->qsort->at($k - 1);
}


### Examples and tests

sub run_tests {
    SKIP: {
        skip "examples" unless $examples;
        is pefsmt(2, 3, 4), 3, 'example 1';
        is pefsmt(3, 3, 6), 4, 'example 2';
    }

    SKIP: {
        skip "tests" unless $tests;
        is pefsmt(997, 1009, 1), 1, 'first element';
        is pefsmt(997, 1009, 997 * 1009), 997 * 1009, 'last element';
	}

    done_testing;
    exit;
}
