#!/usr/bin/env perl
use v5.36;

sub isUgly {
  my $num = shift ;
  my %divisors ;
  my $current = 2 ;
  while ( $num > 1 ) {
      if ( ($num % $current) == 0 ) {
    $divisors{$current}++ ;
    $num /= $current ;
      }
      else {
    $current++ ;
      }
  }
  my $str = join( '' , sort { $a <=> $b } keys %divisors ) ;
  return ( $str =~ /\b[235]+\b/ ) ;
}

my $n = $ARGV[ 0 ] // 10;
my $current = 1 ; #1 assumed to be an ugly number
my $sumUglies = 1 ;#see above
while ( $sumUglies < $n ) {
  $current++ ;
  if (isUgly ( $current ) ) {
      $sumUglies++ ;
  }
}
say $current ;
