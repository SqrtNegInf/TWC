#!/usr/bin/env perl
use strict ;
use warnings ;
use feature 'say' ;
use Algorithm::Combinatorics qw ( combinations ) ;
use List::Util qw ( sum ) ;
use POSIX ;

sub isPrime {
  my $number = shift ;
  my $stop = sqrt( $number ) ;
  for my $i ( 2 .. floor( $stop )) {
      if ( $number % $i == 0 ) {
        return 0 ;
      }
  }
  return 1 ;
}

my ($m , $n ) = (38, 2);

my @primes ;
for my $i (2 .. $m) {
  if ( isPrime( $i ) ) {
      push @primes , $i ;
  }
}
my $iter = combinations( \@primes , $n ) ;
while ( my $c = $iter->next ) {
  if ( sum( @$c ) == $m ) {
      say join (',' , @$c ) ;
  }
}
