#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems } = (13,13,9,1) ) {
    my @xors;
    for 0 ..^ @list.elems -> $left {
	for $left ^..^ @list.elems -> $right {
	    @xors.push: @list[ $left ] +^ @list[ $right ];
	}
    }

    @xors.max.say;
}
