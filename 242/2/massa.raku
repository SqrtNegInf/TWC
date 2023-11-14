#!/usr/bin/env raku

sub SOLUTION(@_) {
    @_».reverse».map: 1 - *
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  ((1, 1, 0), (1, 0, 1), (0, 0, 0)),
           output => ((1, 0, 0), (0, 1, 0), (1, 1, 1)) },
        %{ input =>  ((1, 1, 0, 0), (1, 0, 0, 1), (0, 1, 1, 1), (1, 0, 1, 0)),
           output => ((1, 1, 0, 0), (0, 1, 1, 0), (0, 0, 0, 1), (1, 0, 1, 0)) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
