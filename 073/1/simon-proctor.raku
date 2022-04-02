#!/usr/bin/env raku

sub MAIN(
    $size = 3,
    @numbers =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8)
) {
    @numbers.rotor( $size => 1-$size ).map( *.min ).say;
}
    
