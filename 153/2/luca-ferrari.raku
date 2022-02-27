#!/usr/bin/env raku

sub MAIN( Int $n = 40585) {
    '1'.say and exit if $n.comb.map( { $_ <= 1 ?? 1 !! [*] 1 .. $_ } ).sum == $n;
    '0'.say;
}
