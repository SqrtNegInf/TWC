#!/usr/bin/env raku

my @numbers = (1, 5, 3, 2, 4, 2);
my $k = 2;
my @sorted = @numbers.sort( { $^a <=> $^b} ) ;
my @indices = (0..@numbers.elems -1).grep( { @sorted[ $_] == $k } ) ;
print "(" ;
print @indices.join(',') ;
say ")" ;
