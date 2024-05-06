#!/usr/bin/env raku

sub MAIN( @nums where { @nums.elems == @nums.grep( * ~~ Int ).elems }   = (-1, -2, -3, -4,  3,  2,  1) ) {
    '0'.say and exit if ( @nums.grep( * == 0 ) );
    '-1'.say and exit if ( @nums.grep( * < 0 ).elems !%% 2 );
    '1'.say;
}
