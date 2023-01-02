#!/usr/bin/env raku

#sub MAIN( *@list where { @list.grep( * ~~ Int ).elems == @list.elems } ) {
my @list = (1, 0, 3, 0, 0, 5);
my ( @swapped );
@swapped = | @list.grep( * !~~ 0 ), | @list.grep( * ~~ 0 );
@swapped.join( ',' ).say;
