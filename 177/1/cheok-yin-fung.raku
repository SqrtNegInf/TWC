#!/usr/bin/env raku

say damm_check(@*ARGS[0] || 5724)?? "valid"!! "invalid";


sub damm_check ($num) {

    my @operation_table = 
        [0, 3, 1, 7, 5, 9, 8, 6, 4, 2],
        [7, 0, 9, 2, 1, 5, 4, 8, 6, 3],
        [4, 2, 0, 6, 8, 7, 1, 3, 5, 9],
        [1, 7, 5, 0, 9, 8, 3, 4, 2, 6],
        [6, 1, 2, 3, 0, 4, 5, 9, 7, 8],
        [3, 6, 7, 4, 2, 0, 9, 5, 8, 1],
        [5, 8, 6, 9, 7, 2, 0, 1, 3, 4],
        [8, 9, 4, 5, 3, 6, 2, 0, 1, 7],
        [9, 4, 3, 8, 6, 1, 7, 2, 0, 5],
        [2, 5, 8, 1, 4, 3, 6, 7, 9, 0];

    my $interim = 0;

    my @digit = $num.split("");

    my $i = 0;

    while $i < @digit.elems - 1 {
        $interim = @operation_table[$interim][@digit[$i]];
        $i++;
    }

    return @digit[$i] == $interim;
}


use Test;
is( damm_check(5724), True);
is( damm_check(5725), False);
plan 2;
done-testing;
