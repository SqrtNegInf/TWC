#!/usr/bin/env raku

#my @n = prompt('Input: @n = ') ~~ m:g/\d+/;
my @n = ( 1, 2, 3, 8+2 );
say "Output: {@n.combinations(2).map({ [+&] $_ }).sum}"; 
