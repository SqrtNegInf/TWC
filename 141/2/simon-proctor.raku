#!/usr/bin/env raku

#| Given a two number M and N find the number of "Like Numbers" can be found
sub MAIN (
    UInt \M = 1234, #= Integer used to make sub values
    UInt \N = 2  #= Integer subvales of M should be divisible by
) {
    M.comb.combinations(1..^(M.codes)).map( *.join() ).grep( * %% N ).elems.say;
}
