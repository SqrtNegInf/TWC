#!/usr/bin/env perl

use v5.36;

sub sort_language ( $lang, @positions ) {
    my %pos_map;
    @pos_map{@positions} = @{$lang};
    my @res = @pos_map{ sort @positions };
    return \@res;
}

sub MAIN() {

    #| Run test cases
    use Test::More;

    is_deeply sort_language( [ 'perl', 'c', 'python' ], 2, 1, 3 ),
      [ 'c', 'perl', 'python' ],
      "works for ('c', 'perl', 'python')";
    is_deeply sort_language( [ 'c++', 'haskell', 'java' ], 1, 3, 2 ),
      [ 'c++', 'java', 'haskell' ],
      "works for ('c++', 'java', 'haskell')";
    done_testing;
}

MAIN();
