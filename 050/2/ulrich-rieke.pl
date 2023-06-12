#!/usr/bin/env perl
use v5.36;

sub findNobles {
  my $randoms = shift ;
  my %randHash ;
  for my $elem ( @{$randoms} ) {
      $randHash{$elem}++ ;
  }
  my @sorted = sort { $a <=> $b } keys %randHash ;
  my $len = scalar @sorted ;
  my @nobles ;
  foreach my $i (0..$len - 1  ) {
      if ( $sorted[ $i ] == $len - 1 - $i ) {
    push( @nobles, $sorted[ $i ] ) ;
      }
  }
  return @nobles ;
}


my @L = (19,11,9,7,20,3,17,16,2,14,1);
my @nobles = findNobles( \@L ) ;
if ( @nobles ) {
  map { print "$_ " } @nobles ;
  print "\n" ;
}
else {
  print "There are no nobles this time!\n" ;
}
