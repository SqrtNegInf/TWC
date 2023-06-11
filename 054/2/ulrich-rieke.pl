#!/usr/bin/env perl
use v5.36;

sub findSequence {
  my $n = shift ;
  my @sequence ;
  while ( $n != 1 ) {
      push( @sequence , $n ) ;
      if ( $n % 2 == 0 ) {
    $n /= 2 ;
      }
      else {
    $n = $n * 3 + 1 ;
      }
  }
  push( @sequence , $n ) ;
  return @sequence ;
}

my @sequence = findSequence( 23 ) ;
map { print "$_\n" } @sequence ;
print scalar @sequence . "\n" ;
my @sequences ;
for my $i (1..10000) {
  @sequence = findSequence( $i ) ;
  push( @sequences , [ $i , scalar @sequence] ) ;
}
my @sorted = sort { ${$b}[1] <=> ${$a}[1]} @sequences ;
print "The 20 longest Collatz sequences in numbers up to 1000000:\n" ;
map { print ${$_}[0] . " " . ${$_}[1] . "\n" } @sorted[0..19] ;

