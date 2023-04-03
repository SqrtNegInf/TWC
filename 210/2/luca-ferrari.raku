#!/usr/bin/env raku

sub MAIN( @list is copy where { @list.grep( * ~~ Int ).elems == @list.elems } = (2,3,-1)  ) {

    my $move = True;

    while ( $move ) {
	$move = False;
	for 0 ..^ @list.elems - 1 {

	    my ( $left, $right ) = @list[ $_ ], @list[ $_ + ( @list[ $_ ] > 0 ?? 1 !! -1 ) ];
	    next if ( ! $left || ! $right );
	    next if ( $left > 0 && $right > 0 );
	    next if ( $left < 0 && $right < 0 );

	    $move = True;
	    @list[ $_ + ( @list[ $_ ] > 0 ?? 1 !! -1 ) ] = Nil if ( $left.abs >= $right.abs );
	    @list[ $_ ]     = Nil if ( $left.abs <= $right.abs );

	}
	@list = @list.grep( * ~~ Int );
    }

    @list.grep( * ~~ Int ).join( ', ' ).say;
}
