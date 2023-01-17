#!/usr/bin/env raku

sub MAIN(
			   Int $x = 7,
			   Int $y = 2,
			   Int $z = 3,
			   @list = (3,0,1,1,9,7) ) { 


    my @triplets;
    for 0 ..^ @list.elems -> $i {
	for $i ^..^@list.elems -> $j {
	    for $j ^..^ @list.elems -> $k {
		@triplets.push: [ $i, $j, $k, @list[ $i ], @list[ $j ], @list[ $k ] ]
				    if ( ( @list[ $i ] - @list[ $j ] ).abs <= $x
					&& ( @list[ $j ] - @list[ $k ] ).abs <= $y
					&& ( @list[ $i ] - @list[ $k ] ).abs <= $z );

	    }
	}
    }

    @triplets.elems.say;
    @triplets.map( { "Indexes $_[0], $_[1], $_[2] are good ($_[3], $_[4], $_[5])" } ).join( "\n" ).say;
}
