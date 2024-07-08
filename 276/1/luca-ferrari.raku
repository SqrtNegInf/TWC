#!/usr/bin/env raku

#sub MAIN( *@hours where { @hours.elems == @hours.grep( * ~~ Int ) } ) {
my @hours = (12, 12, 24, 24, 30);
    @hours.combinations( 2 ).grep( { ( $_[ 0 ] + $_[ 1 ] ) %% 24 } ).say;
#}
