#!/usr/bin/env raku

my @numbers = (5, 3, 6, 1, 12);
my $startn = 3;
my $start = +$startn ;
my $found = $start ;
while ( so $found == @numbers.any ) {
   $found *= 2 ;
}
say $found ;
