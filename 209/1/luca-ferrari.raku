#!/usr/bin/env raku

sub MAIN( @bits = <1 1 1 0>) {
    my @chars = @bits.rotor( 2, :partial ).map(
	                                        {
						       given ( $_.join ) {
						           when '10' { 'b' }
						           when '11' { 'c' }
						           when '0'  { 'a' }
						           default   { 'z' }
						       }
                                                 } );

    '1'.say and exit if ( @chars[ * - 1 ] ~~ 'a' );
    '0'.say;
}
