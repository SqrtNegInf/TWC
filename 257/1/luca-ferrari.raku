#!/usr/bin/env raku

#sub MAIN( *@numbers where { @numbers.elems == @numbers.grep( * ~~ Int ).elems } ) {
my @numbers = (5, 2, 1, 6);
    @numbers.map( -> $current { @numbers.grep( * < $current ).elems } ).join( ', ' ).say;
#}
