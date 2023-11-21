#!/usr/bin/env raku

sub SOLUTION(@_) {
    [+] @_ Xdiv @_
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (2, 5, 9),
           output => (10,) },
        %{ input =>  (7, 7, 7, 7, 7, 7, 7),
           output => (49,) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
