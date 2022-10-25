#!/usr/bin/env raku

sub MAIN( @n = (1, 2, 3, 1, 2, 3, 7, 9, 10, 5, 10) ) {

    my $max = 0;
    my @triplet;
    for 0 ..^ @n.elems -> $index-a {
    	my $a = @n[ $index-a ].Int;

	for $index-a ^..^ @n.elems -> $index-b {
	    my $b = @n[ $index-b ].Int;

	    for $index-b ^..^ @n.elems -> $index-c {
	    	my $c = @n[ $index-c ].Int;

		if ( $max <= $a + $b + $c
		     && ( $a + $b ) > $c
		     && ( $b + $c ) > $a
		     && ( $a + $c ) > $b ) {
		     @triplet = $a, $b, $c;
		     $max = $a + $b + $c;
		}
	    }
	}
    }

    @triplet.sort.say if ( @triplet );
}
