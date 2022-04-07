#!/usr/bin/env perl
use strict ;
use warnings ;

sub findSublists {
  my $array = shift ;
  my $len = scalar (@{$array}) - 1 ;
  my @sublists ;
  for my $start (0..$len - 1 ) {
      for my $end ( $start + 1 ..$len ) {
    my @sublist = @{$array}[$start..$end] ;
    push( @sublists, \@sublist ) ;
      }
  }
  return @sublists ;
}

my @input = ( 2, 5, -1, 3 );
my @sublists = findSublists( \@input ) ;
my %producthash ;
for my $sublist ( @sublists ) {
  my $product = 1 ;
  for my $element ( @{$sublist} ) {
      $product *= $element ;
  }
  $producthash{ $product } = $sublist ;
}
my @sorted = sort { $b <=> $a } keys %producthash ;
my $biggest_product = $sorted[ 0 ] ;
print "The biggest product ( $biggest_product ) is produced by " ;
print "[ " ;
print join( ', ' , @{$producthash{ $biggest_product }} ) ;
print " ]!\n" ;
