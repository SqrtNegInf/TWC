#!/usr/bin/env perl
use v5.36;

my @array = <1 2 1 2>;
my $len = scalar @array ;
my $value = 0 ;
my $current = 0 ;
while ( $array[ $current ] ) {
  $current += $array[ $current ] ;
  if ( $current == $len - 1 ) {
      $value = 1 ;
      last ;
  }
  if ( $current < $len - 1 and $array[ $current ] == 0 ) {
      last ;
  }
}
print "$value\n" ;
