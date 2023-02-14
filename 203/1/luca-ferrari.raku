#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems } = <9 0 1 2 3 4 5 6> )  {
    my @quadruplets;

    for 0 ..^ @list.elems -> $a {
	for $a ^..^ @list.elems -> $b {
	    for $b ^..^ @list.elems -> $c {
		for $c ^..^ @list.elems -> $d {
		    my ( $la, $lb, $lc, $ld ) = @list[ $a ], @list[ $b ], @list[ $c ], @list[ $d ];
		    @quadruplets.push: [ $la, $lb, $lc, $ld ] if ( ( $la + $lb + $lc ) == $ld );
		}
	    }
	}
    }

#    @quadruplets.join( "\n -> " ).say if $verbose;
    @quadruplets.elems.say;
}
