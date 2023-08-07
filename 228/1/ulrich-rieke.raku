#!/usr/bin/env raku

sub count( @haystack , $needle ) {
   return @haystack.grep( { $_ == $needle} ).elems ;
}

my @numbers = (2, 1, 3, 2);
say @numbers.grep( { count( @numbers , $_ ) == 1 } ).sum ;
