#!/usr/bin/env raku

sub MAIN( Int $k = 1, @nums =  (2, 5, 9, 11, 3) ) {  
    my @indexes = ( 0 ..^ @nums.elems ).grep( { $_.base( 2 ).comb.grep( * == 1 ).elems == $k } );
    @nums[ @indexes ].sum.say;

}
