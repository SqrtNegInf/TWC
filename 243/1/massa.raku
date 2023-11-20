#!/usr/bin/env raku

sub SOLUTION(@m) {
    + @m.pairs.combinations(2).grep({.[0].value > 2 * .[1].value})».key
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (1, 3, 2, 3, 1),
           output => (2,) },
        %{ input =>  (2, 4, 3, 5, 1),
           output => (3,) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
