#!/usr/bin/env perl
use v5.36;
use List::Util qw ( all ) ;

sub isReversible {
  my $num = shift ;
  my $sum = $num + (reverse $num ) ;
  return all { $_ % 2 == 1 } split ( // , $sum ) ;
}

say join( ',' , grep { isReversible( $_ ) } (1 .. 100) ) ;
