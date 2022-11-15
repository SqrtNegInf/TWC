#!/usr/bin/env raku

sub MAIN( Str $word = 'Raku' ) {

    '1'.say and exit if ( $word ~~ /
			  | ^ <[A .. Z]> <[a .. z]>+ $
			  |  ^ <[a..z]>+ $
			  | ^ <[A..Z]>+ $ / );
    '0'.say;
}
