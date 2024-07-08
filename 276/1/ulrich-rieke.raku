#!/usr/bin/env raku

#say "Enter some positive integers, separated by blanks!" ;
#my $line = $*IN.get ;
my @numbers = (12, 12, 24, 24,         30);
say @numbers.combinations( 2 ).grep( { $_.sum %% 24 } ).elems ;
