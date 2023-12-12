#!/usr/bin/env raku

srand 1;

sub MAIN() {

    my @lottery;
    while ( @lottery.elems < 6 ) {
	@lottery.push: $_ if ( ! @lottery.grep( $_ ) ) given ( 49.rand.Int );
    }

    @lottery.join( "\n" ).say;
}
