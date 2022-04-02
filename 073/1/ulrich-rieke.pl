#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub findMinimum {
  my $array = shift ;
  my $minimum = $array->[0] ;
  for my $i (1..scalar @{$array} - 1 ) {
      if ( $array->[ $i ] < $minimum ) {
    $minimum = $array->[ $i ] ;
      }
  }
  return $minimum ;
}

my $S = 3;
my @array =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
my $len = scalar @array ;
my @minimums ;
if ( $S > $len ) {
  say "Array too small for given window!" ;
  exit( 1 ) ;
}
else {
  for my $i (0 .. $len - $S) {
      my @partialList = @array[$i .. $i + $S - 1] ;
      push( @minimums , findMinimum( \@partialList)) ;
  }
}
print "(" ;
map { print "$_ " } @minimums ;
print ")\n" ;
