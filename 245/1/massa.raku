#!/usr/bin/env raku

sub SOLUTION(@ (@lang, @pop)) {
    (@pop Z=> @lang).sort(*.keys)».value
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (<perl c python>, (2, 1, 3)),
           output => <c perl python> },
        %{ input =>  (<c++ haskell java>, (1, 3, 2)),
           output => <c++ java haskell> },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
