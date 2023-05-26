#!/usr/bin/env perl
use v5.36;

use POSIX qw ( floor ) ;
use List::Util qw ( sum ) ;

my $N = $ARGV[0] // 34;
if ( $N < 10 ) {
  die "number must be greater than 9!" ;
}
my @squarenums = map { $_ ** 2 } split (// , $N ) ;
my $squaresum = sum @squarenums ;
if ( floor( sqrt( $squaresum ) ) == sqrt( $squaresum ) ) {
  say 1 ;
}
else {
  say 0 ;
}
