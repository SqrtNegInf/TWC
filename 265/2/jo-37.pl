#!/usr/bin/env perl
use v5.24;
use experimental 'signatures';

use Test2::V0 -srand => 1;
use List::AllUtils qw(pairmap min_by count_by);

our ($tests, $examples) = (1,1);

run_tests() if $tests || $examples;	# does not return

die <<EOS unless @ARGV;
usage: $0 [-examples] [-tests] [TARGET WORD...]

-examples
    run the examples from the challenge
 
-tests
    run some tests

TARGET
    target string

WORD...
    list of words

EOS


### Input and Output

say completing_word(@ARGV);


### Implementation

sub completing_word ($str, @str) {
    my $target = qr{
        ^
        @{[
            pairmap { '(?=' . ".*?$a" x $b . ')'}
            count_by {$_}
            lc($str) =~ /([[:alpha:]])/g
        ]}
        [[:alpha:]]*
        $
    }x;

    min_by {length} grep {lc =~ /$target/} @str;
}


### Examples and tests

sub run_tests {
    SKIP: {
        skip "examples" unless $examples;
        is completing_word('aBc 11c' => 'accbbb', 'abc', 'abbc'),
            'accbbb', 'example 1';
        is completing_word('Da2 abc' => 'abcm', 'baacd', 'abaadc'),
            'baacd', 'example 2';
        is completing_word('JB 007' => 'jj', 'bb', 'bjb'),
            'bjb', 'example 3';
    }

    SKIP: {
        skip "tests" unless $tests;
	}

    done_testing;
    exit;
}
