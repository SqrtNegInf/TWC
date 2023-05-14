#!/usr/bin/env perl
use v5.36;
use List::Util qw (product ) ;

sub factorial {
  my $number = shift ;
  if ( $number == 0 ) {
      return 1 ;
  }
  else {
      return product( 1 .. $number ) ;
  }
}

sub leftFactorial {
  my $number = shift ;
  my $sum = 0 ;
  map { $sum += factorial( $_ ) } (0 .. $number - 1 ) ;
  return $sum ;
}

my @leftFactorials ;
for my $i (1 .. 10) {
  push @leftFactorials , leftFactorial( $i ) ;
}
say join( ',' , @leftFactorials) ;
