#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[0] // 99;
my @bits ;
while ( $N != 0 ) {
  unshift( @bits , $N % 2 ) ;
  $N = int( $N / 2 ) ;
}
if ( join( '' , @bits )  ne scalar ( reverse @bits )) {
  say 0 ;
}
else {
  say 1 ;
}
