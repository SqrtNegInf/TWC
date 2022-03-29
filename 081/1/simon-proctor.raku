#!/usr/bin/env raku

#| Given two strings find the common root strings 
sub MAIN ($a = 'abcdabcd', $b = 'abcdabcdabcdabcd') {
    .say for ( get-roots($a) (&) get-roots($b) ).keys.sort;
}

sub get-roots( Str $a ) {
    ($a ~~ m:ex/^ (.+?) $0* $/).map(*[0].Str);
}
    
