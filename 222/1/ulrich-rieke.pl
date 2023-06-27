#!/usr/bin/env perl
use v5.36;

my @numbers = (1, 1, 4, 2, 1, 3);
my @sorted = sort { $a <=> $b } @numbers ;
my $samepos = 0 ;
for my $i ( 0 .. scalar( @numbers ) - 1 ) {
  if ( $sorted[ $i ] == $numbers[ $i ] ) {
      $samepos++ ;
  }
}
say $samepos ;
