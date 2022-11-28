#!/usr/bin/env raku

sub MAIN( Int $n where { $n > 0 } = 2⁶⁴ + 1 ) {
    $n.base(2).comb.map( { $_ == 0 ?? 1 !! 0 } ).join.parse-base(2).say;
}
