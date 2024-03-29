#!/usr/bin/env perl
use v5.36;

sub wr {
    my $matrix = $_[0];
    my @rows = $matrix->@*;
    my @weight = map {scalar grep {$_} $_->@*} @rows;
    my @ord = sort {$weight[$a] <=> $weight[$b] || $a<=>$b} 0..$#rows;
    return [@ord];
}

use Test2::V0 -srand => 1;
is wr([
                   [1, 1, 0, 0, 0],
                   [1, 1, 1, 1, 0],
                   [1, 0, 0, 0, 0],
                   [1, 1, 0, 0, 0],
                   [1, 1, 1, 1, 1]
                 ]
), [2,0,3,1,4];

is wr([
                   [1, 0, 0, 0],
                   [1, 1, 1, 1],
                   [1, 0, 0, 0],
                   [1, 0, 0, 0]
                 ]
), [0,2,3,1];
done_testing();
