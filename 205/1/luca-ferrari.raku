#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems } = (5,4,4,3) ) {

    my @highests = @list.unique.sort;
    @highests[ * - ( @highests.elems > 2 ?? 3 !! 1 ) ].say;
}
