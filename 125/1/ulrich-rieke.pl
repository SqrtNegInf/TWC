#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[ 0 ] // 60;
my %triples ;
for my $i (1 .. 100 ) {
  for my $j (1 .. 100 ) {
      for my $k (1 .. 100 ) {
    if ( ($i ** 2) + ( $j ** 2 ) == $k ** 2 ) {
        if ( ($i == $N) or ( $j == $N ) or ( $k == $N )) {
          my @sorted = sort { $a <=> $b } ( $i , $j , $k ) ;
          $triples{join( ', ' ,  @sorted)}++ ;
        }
    }
      }
  }
}
if ( keys %triples ) {
  map { say '(' . $_ . ')' } sort keys %triples ;
}
else {
  say -1 ;
}
