#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;

sub findMaximum {
  my $array = shift ;
  my $maximum = shift @$array ;
  while ( @$array ) {
      my $el = shift @$array ;
      if ( $el > $maximum ) {
    $maximum = $el ;
      }
  }
  return $maximum ;
}

my @array = <9 10 7 5 6 1>;
my @leaders ;
my $len = scalar @array ;
for my $i (0 .. $len - 2 ) {
  my @subarray = @array[$i + 1 .. $len - 1] ;
  my $localmax = findMaximum( \@subarray) ;
  if ( $array[ $i ] > $localmax) {
      push( @leaders, $array[ $i ] ) ;
  }
}
push (@leaders, $array[-1] ) ;
my $line = '(' . join( " , " , @leaders ) . ')' ;
say $line ;
