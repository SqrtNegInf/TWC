#!/usr/bin/env perl

use v5.36;

use List::Util qw/sum/;

sub same_string ( $arr1, $arr2 ) {
    join( '', @$arr1 ) eq join( '', @$arr2 ) ? 1 : 0;
}

sub MAIN() {

    use Test::More;

    is same_string( [ "ab", "c" ], [ "a", "bc" ] ), 1,
      'works for ([ "ab", "c" ], [ "a", "bc" ])';
    is same_string( [ "ab", "c" ], [ "ac", "b" ] ), 0,
      'works for ([ "ab", "c" ], [ "ac", "b" ])';
    is same_string( [ "ab", "cd", "e" ], ["abcde"] ), 1,
      'works for ([ "ab", "cd", "e" ], ["abcde"])';

    done_testing;
}

MAIN();
