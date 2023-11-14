#!/usr/bin/env raku

sub SOLUTION(@ (@a, @b)) {
    (@a ∖ @b, @b ∖ @a)».keys».sort
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  ((1, 2, 3), (2, 4, 6)),
           output => ((1, 3), (4, 6)) },
        %{ input =>  ((1, 2, 3, 3), (1, 1, 2, 2)),
           output => ((3,), ()) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)


