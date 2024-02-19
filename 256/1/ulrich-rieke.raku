#!/usr/bin/env raku

my @strings = <ab de ed bc>;
my @reversed = @strings.map( {$_.comb.reverse.join} ) ;
my $common = @strings.Set (&) @reversed.Set ;
say $common.keys.elems div 2 ;
