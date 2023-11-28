#!/usr/bin/env raku

sub SOLUTION(@_) {
    [+] @_.combinations.grep(+ *).map: { .max² * .min }
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (2, 1, 4),
           output => (141,) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
