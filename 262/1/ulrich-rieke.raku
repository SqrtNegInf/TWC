#!/usr/bin/env raku

my @numbers = (-3, 1, 2, -1, 3, -2, 4);
my $positives = @numbers.grep( {$_ > 0} ).elems ;
my $negatives = @numbers.grep( {$_ < 0} ).elems ;
say max( $positives, $negatives ) ;
