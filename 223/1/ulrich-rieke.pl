#!/usr/bin/env perl
use v5.36;

sub isPrime {
  my $number = shift ;
  if ( $number == 1 ) {
      return 0 ;
  }
  if ( $number == 2 ) {
      return 1 ;
  }
  for ( my $i = 2 ; $i < int ( $number / 2 + 1 ) ; $i++ ) {
      if ( $number % $i == 0 ) {
        return 0 ;
        last ;
      }
  }
  return 1 ;
}

for my $number (10, 1, 20) {
    say scalar( grep { isPrime( $_ ) } (2..$number) )
}
