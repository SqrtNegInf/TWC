#!/usr/bin/env raku

sub MAIN( @nums where { @nums.grep( * ~~ Int ).elems == @nums.elems }  = (4, 4, 2, 4, 3) ) {
    my @triples;

    #(i, j, k) that satisfies num[i] != num[j], num[j] != num[k] and num[k] != num[i].
    for 0 ..^ @nums.elems - 2  -> $i {
	for $i ^..^ @nums.elems - 1 -> $j {
	    for $j ^..^ @nums.elems -> $k {
		@triples.push: [ $i, $j, $k ] if ( @nums[ $i ] != @nums[ $j ]
						   && @nums[ $j ] != @nums[ $k ]
						   && @nums[ $k ] != @nums[ $i ] );
	    }
	}
    }

    @triples.join( "\n" ).say;
}
