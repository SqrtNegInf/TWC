#!/usr/bin/env perl
use v5.36;

use List::Util qw ( sum ) ;

my $N = 120;
my @elements ;
my $firsttime = 1 ;
my $sum = 0 ;
my $hashstring ;
if ( $N == 1 ) {
  $hashstring = "#" ;
}
else {
  push @elements , "#" ;
  $sum += 1 ;
  while ( $sum < $N ) {
      if ( $elements[ -1] =~ /\d/ ) {
    push @elements, "#" ;
    $sum += 1 ;
      }
      else {
    my $newNumber ;
    if ( $firsttime ) {
        $newNumber = $N ;
        $firsttime = 0 ;
    }
    else {
        $newNumber = $N - (sum (map { length( $_ ) } @elements)) + 1 ;
    }
    push @elements, $newNumber ;
    $sum += length $newNumber ;
      }
  }
  $hashstring = join( '' , reverse @elements ) ;
}
say $hashstring ;
