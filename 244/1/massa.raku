#!/usr/bin/env raku

sub SOLUTION(@a) {
    (@a X> @a)».Int.batch(+@a).map(*.sum)
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (8, 1, 2, 2, 3),
           output => (4, 0, 1, 1, 3) },
        %{ input =>  (6, 5, 4, 8),
           output => (2, 1, 0, 3) },
        %{ input =>  (2, 2, 2),
           output => (0, 0, 0) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)


