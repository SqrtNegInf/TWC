#!/usr/bin/env raku

sub MAIN( @n where { @n.grep( * ~~ Int ) == @n.elems } = (0, 1, 3, 5, 9, 10) ) {
    my @missing-numbers;
    for 0 ^.. @n.elems {
	    @missing-numbers.push: $_ if ( ! @n.grep( $_ ) );
    }

    @missing-numbers.join( ', ' ).say;

}
