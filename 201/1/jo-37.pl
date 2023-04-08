#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;
use List::Util 'sum';
use experimental 'postderef';

our ($tests, $examples, $benchmark, $single) = (1);

run_tests() if $tests || $examples || $benchmark;	# does not return

say for find_missing($single, @ARGV);


sub find_missing {
    # The easy way:
    return @_ * (@_ + 1) / 2 - sum @_ if shift;

    # The hard way:
    (\my %num)->@{0 .. @_} = ();
    delete @num{@_};
    sort {$a <=> $b} keys %num;
}


sub run_tests {
    SKIP: {
        skip "examples" unless $examples;

        is [find_missing(-single, 0, 1, 3)], [2], 'example 1, single';
        is [find_missing(undef,   0, 1, 3)], [2], 'example 1, multi';
        is [find_missing(-single, 0, 1)],    [2], 'example 2, single';
        is [find_missing(undef,   0, 1)],    [2], 'example 2, multi';
    }

    SKIP: {
        skip "tests" unless $tests;

        is [find_missing(undef, 4, 7, -1)], [0 .. 3], 'nothing in list';
	}

    SKIP: {
        skip "benchmark" unless $benchmark;

        is [find_missing(-single, 1 .. 1000000)], [0], 'sum';
        is [find_missing(undef,   1 .. 1000000)], [0], 'hash';

        cmpthese(0, {
                sum  => sub {find_missing(-single, 1 .. 1000000)},
                hash => sub {find_missing(undef,   1 .. 1000000)},
            });
    }

    done_testing;
    exit;
}

__DATA__
       Rate  hash   sum
hash 1.47/s    --  -97%
sum  48.2/s 3187%    --
