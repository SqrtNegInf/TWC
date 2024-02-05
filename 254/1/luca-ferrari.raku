#!/usr/bin/env raku

sub MAIN( Int $n = 27 ) {
    #    say ( $n ** ( 1 / 3 ) ).Int == ( $n ** ( 1 / 3 ) );
    for ( 2 ..^ $n.sqrt.Int ) {
	'true'.say and exit if ( $_ ** 3 == $n );
    }

    'false'.say;
}
