#!/usr/bin/env raku

#| Given a shift amount (integer can be negative) and a list of string encode using the Ceaser Cypher
#sub MAIN(
    my $shift = 13;
    my @words = 'RAKU ROCKS';
#) {
    my @alpha = ("A".."Z").Array;
    if ( $shift < 0 ) { $shift = 26+$shift }
    my @shifted = [ |@alpha[(26-$shift)..25], |@alpha[0..(25-$shift)] ];
    
    say @words.map( { $_.trans( @alpha.join => @shifted.join ) } ).join(" ");
#}
