#!/usr/bin/env perl
use v5.36;

my @array = (1, 2, 2, 3, 2, 4, 2);
my %frequencies ;
my $len = scalar @array ;
while ( @array ) {
  $frequencies{ shift @array }++ ;
}
my @sorted = sort { $frequencies{ $b } <=> $frequencies{ $a } } keys
%frequencies ;
if ( $frequencies{ $sorted[ 0 ] } > int( $len / 2 ) ) {
  say $sorted[ 0 ] ;
}
else {
  say -1 ;
}
