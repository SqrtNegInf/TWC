#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw( subsets ) ;

sub is_arithmetic {
  my $array = shift ;
  my $len = scalar( @$array ) ;
  my $start = $array->[1] - $array->[0] ;
  for my $i ( 1..$len - 2 ) {
      if ( $array->[ $i + 1 ] - $array->[$i] != $start ) {
    return 0 ;
      }
  }
  return 1 ;
}

my @numbers = (9, 4, 7, 2, 10);
my $len = scalar ( @numbers ) ;
my $iter = subsets( \@numbers ) ;
my $maxlen = 0 ;
while ( my $c = $iter->next ) {
  my $sublen = scalar( @$c ) ;
  if ( $sublen > 1 ) {
      if ( is_arithmetic( $c ) ) {
    if ( $sublen > $maxlen ) {
        $maxlen = $sublen ;
    }
      }
  }
}
say $maxlen ;
