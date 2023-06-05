#!/usr/bin/env raku

#sub MAIN( *@n where { @n.grep( * ~~ Int ).elems == @n.elems } ) {
    (-2,-1,0,3,4).map( { $_ ** 2 } ).sort.join( ', ' ).say;
#}
