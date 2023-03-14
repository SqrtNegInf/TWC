#!/usr/bin/env raku

sub MAIN( @words = <Hello Alaska Dad Peace>) {
    my @keyboard = qw/ qwertyuiop asdfghjkl zxcvbnm /;

    for @words -> $current-word {
	for @keyboard -> $current-row {
	    my $found = 0;
	    for $current-word.lc.comb -> $current-letter {
		$found++ if ( $current-row ~~ /$current-letter/  );
	    }

	    $current-word.say if $current-word.chars == $found;
	}
    }

}
