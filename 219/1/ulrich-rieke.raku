#!/usr/bin/env raku

my @numbers = (-2,-1,0,3,4);
my @sorted = @numbers.map( { $_ ** 2 } ).sort( { $^a <=> $^b } ) ;
say "(" ~ @sorted.join( ',' ) ~ ")" ;
