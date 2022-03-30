#!/usr/bin/env raku

my @array = (5, 2, -2, 0);
my $positiveSet = @array.grep( { $_ > 0 } ).Set ;
my $current = 1 ;
while ( $current (elem) $positiveSet ) {
  $current++ ;
}
say $current ;
