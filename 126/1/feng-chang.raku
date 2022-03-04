#!/usr/bin/env raku

sub MAIN(UInt:D $N = 200) {
    put (2..$N).grep(!*.comb.grep(1)).elems;
}
