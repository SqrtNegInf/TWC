#!/usr/bin/env perl
use strict ;
use warnings ;

sub mergeArrays {
  my $firstarray = shift ;
  my $secondarray = shift ;
  my @merged ;
  for (0..scalar @$firstarray + scalar @$secondarray - 1 ) {
      if ( @$firstarray ) {
    push( @merged, shift @$firstarray ) ;
      }
      if ( @$secondarray ) {
    push ( @merged , shift @$secondarray ) ;
      }
  }
  return @merged ;
}

my @array = 1..5;
my @original = @array ;
my $len = scalar @array ;
my $half = int( $len / 2 ) ;
my @firstpart = @array[0..$half - 1] ;
my @reversed = reverse @array[$half..$len - 1] ;
my @merged = mergeArrays( \@firstpart , \@reversed ) ;
print "Original:\n" ;
print join ("->" , @original ) . "\n" ;
print "reordered:\n" ;
print join( "->" , @merged ) . "\n" ;

