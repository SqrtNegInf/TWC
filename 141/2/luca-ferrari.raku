#!/usr/bin/env raku

sub MAIN( Int $m = 1234, Int $n = 2) {
    $m.comb.combinations( 1 ..^ $m.Str.chars ).map( *.join.Int ).grep( * %% $n ).unique.sort.say;

}
