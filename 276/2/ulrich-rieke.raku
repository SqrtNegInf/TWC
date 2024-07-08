#!/usr/bin/env raku

my @numbers = [1, 2, 2, 4, 1, 5];
my %frequencies ;
@numbers.map( {%frequencies{$_}++} ) ;
my $maximum = %frequencies.values.max ;
my @keys = %frequencies.keys ;
my $number = @keys.grep( {%frequencies{$_} == $maximum} ).elems ;#number of element
#with maximum frequency
#what we look for is the product of maximum frequency and the number of elements that
#have that maximum frequency!
say ( $number * $maximum ) ;
