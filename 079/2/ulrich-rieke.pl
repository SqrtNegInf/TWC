#!/usr/bin/env perl
use v5.36;

sub findSmaller {
  my $a = shift ;
  my $b = shift ;
  if ( $a < $b ) {
      return $a ;
  }
  else {
      return $b ;
  }
}

my @array = (2,1,4,1,2,5);
my $len = scalar @array ;
my $drops = 0 ;
my $oldMax ;
my $oldMaxIndex ;
my $newMax ;
my $newMaxIndex ;
my $current = 0 ;
while ( $current < $len - 1 ) {
  if ( $array[ $current + 1 ] < $array[ $current ] ) {
      $oldMax = $array[ $current ] ;
      $oldMaxIndex = $current ;
  }
  if ( $array[ $current + 1 ] > $array[ $current ] ) {
      $newMax = $array[ $current + 1 ] ;
      $newMaxIndex = $current + 1 ;
      my $smaller = findSmaller( $oldMax , $newMax ) ;
      map { $drops += $smaller - $_ ; $_ = $smaller }
      @array[$oldMaxIndex + 1 .. $newMaxIndex - 1] ;
  }
  $current++ ;
}
say $drops ;
