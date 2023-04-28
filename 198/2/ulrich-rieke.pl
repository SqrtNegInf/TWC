#!/usr/bin/env perl
use v5.36;
use POSIX ;

sub isPrime {
  my $number = shift ;
  if ( $number < 2 ) {
      return 0 ;
  }
  my $stop = sqrt( $number ) ;
  for my $i ( 2 .. floor( $stop )) {
      if ( $number % $i == 0 ) {
        return 0 ;
      }
  }
  return 1 ;
}

my $number = 100 ;
say scalar( grep { isPrime( $_ ) } (0..$number - 1 ) ) ;
