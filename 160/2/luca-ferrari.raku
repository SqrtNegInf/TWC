#!/usr/bin/env raku

sub MAIN( @A where { @A.grep( * ~~ Int ).elems == @A.elems } = [1, 3, 5, 7, 9 ] ) {
    for 1 ..^ @A.elems {
        .say and exit if @A[ 0 .. $_ - 1 ].sum == @A[ $_ .. * - 1 ].sum;
    }
    '-1'.say;

}
