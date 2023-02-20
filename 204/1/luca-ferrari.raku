#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems } = (1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19) ) {
    my $monotonic-type;
    for 0 ^..^ @list.elems {
	if ( ! $monotonic-type ) {
	    $monotonic-type = ( @list[ $_ ] > @list[ $_ - 1 ] ) ?? True !! False;
	}

	# elements are the same
	next if @list[ $_ ] == @list[ $_ - 1 ];

	'0'.say and exit if ( ! $monotonic-type && @list[ $_ ] > @list[ $_ - 1 ] );
	'0'.say and exit if (   $monotonic-type && @list[ $_ ] < @list[ $_ - 1 ] );
    }

    '1'.say;
}
