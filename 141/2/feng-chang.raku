#!/usr/bin/env raku

sub MAIN(UInt:D \m = 1234, UInt:D \n = 2) {
    put m.comb.combinations(1 .. m.comb.elems-1)».join.grep(* %% n).elems;
}
