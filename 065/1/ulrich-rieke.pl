#!/usr/bin/env perl
use v5.36;

sub digitsum {
  my $number = shift ;
  my $sum = 0 ;
  map { $sum += $_ } split ( // , $number ) ;
  return $sum ;
}

my $N = 2 ;
my $S = 10 ;
my $lowest = '1' . '0' x ( $N - 1 ) ;
my $highest = '9' . '9' x ( $N - 1 ) ;
map { print "$_\n" } grep { digitsum( $_ ) == $S } ($lowest..$highest) ;
