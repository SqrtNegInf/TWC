#!/usr/bin/env raku

sub SOLUTION(@_) {
   @_.combinations.skip(1).map(*.permutations».join».Int).flat.sort(-*).first(* %% 3) or -1
}

#multi MAIN (Bool :$test!) {
    use Test;

    my @tests =
        %{ input =>  (8, 1, 9),
           output => (981,) },
        %{ input =>  (8, 6, 7, 1, 0),
           output => (8760,) },
        %{ input =>  (1,),
           output => (-1,) },
    ;

    .<input>.&SOLUTION.deepmap({$_}).&is-deeply: .<output>, .<text> for @tests
#} # end of multi MAIN (Bool :$test!)
