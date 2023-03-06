#!/usr/bin/env raku

die 'not ok - disabled, does not work';

sub MAIN( @list where { @list.elems %% 2 && @list.grep( * ~~ Int ).elems == @list.elems } = [1,2,3,4,5,6] ) {
    my @sums;

    for @list.permutations {
	for $_.rotor( 2 ) -> $a, $b {
	    @sums.push: sum( min( $a ) + min( $b ) );
	}
    }

    @sums.min.say;
}
