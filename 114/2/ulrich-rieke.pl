#!/usr/bin/env perl
use v5.36;

sub toBinaryString {
  my $number = shift ;
  my @digits ;
  while ( $number != 0 ) {
      unshift ( @digits , $number % 2 ) ;
      $number = int( $number / 2 ) ;
  }
  return join( '' , @digits ) ;
}

sub countOnes {
  my $number = shift ;
  my $len = length( $number ) ;
  my $sum = 0 ;
  for my $i ( 0 .. $len - 1 ) {
      if ( substr( $number , $i , 1 ) eq "1" ) {
    $sum++ ;
      }
  }
  return $sum ;
}

my $N = $ARGV[ 0 ] // 12;
my $ones = countOnes( toBinaryString( $N ) ) ;
do {
  ++$N ;
} until ( countOnes( toBinaryString( $N ) ) == $ones ) ;
say $N ;
