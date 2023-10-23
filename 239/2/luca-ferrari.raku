#!/usr/bin/env raku

sub MAIN( Str $allowed = 'ab', @words = <ad bd aaab baa badab> ) {
    my @allowed;
    for @words -> $current-word {
	my $found = True;

	for $current-word.comb -> $current-char {
	    $found = False and last if ( ! $allowed.comb.grep( * ~~ $current-char ) );
	}

	@allowed.push: $current-word if ( $found );
    }

    @allowed.join( ', ' ).say;
}
