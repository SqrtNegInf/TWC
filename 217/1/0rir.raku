#!/usr/bin/env raku
use Test;

my @Test =
    ([3, 1, 2], [5, 2, 4], [0, 1, 3]),  ( 0,1,1,2,2,3,3,4,5),
    ([1, 0, 3], [0, 0, 0], [1, 2, 1]),  ( 0,0,0,0,1,1,1,2,3),
    ([2, 1], [4, 5])                 ,  ( 1,2,4,5),
;

plan @Test/2;

sub iron-n-sort( @a -->Array) {
    @a.flat.sort.Array;
}

for @Test -> @in, @exp {
    is iron-n-sort(@in), @exp, "@in[] --> @exp[]";
}
done-testing;

my $matrix = ([2, 1], [4, 5]);
say "\nInput: @matrix = ", $matrix, "\nOutput: ", (iron-n-sort $matrix)[2];
exit;

