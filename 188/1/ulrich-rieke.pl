#!/usr/bin/env perl
use v5.36;

my @numbers = (4, 5, 1, 6, 2);
my $k = $numbers[-1] ;
my $count = 0 ;
my $len = scalar( @numbers ) ;
for my $i ( 0 .. $len - 3 ) {
  for my $j ( $i + 1 .. $len - 2 ) {
      if (( $numbers[ $i ] + $numbers[ $j ] ) % $k == 0 ) {
    $count++ ;
      }
  }
}
say $count ;
