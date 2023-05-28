#!/usr/bin/env perl
use v5.36;

sub createPieceHash {
  my $word = shift ;
  my $chunklen = shift ;
  my $len = length $word ;
  my %piecehash ;
  my $start = 0 ;
  while ( $start + $chunklen < $len ) {
      $piecehash{ substr( $word , $start , $chunklen ) }++ ;
      $start += $chunklen ;
  }
  return %piecehash ;
}

my $N = 1;
my $D = 12;
my $numberstring = sprintf( "%.15f" , $N / $D ) ;
$numberstring =~ /^(\d+)\.(\d+)$/ ;
my $whole = $1 ;
my $fractional = $2 ;
my %numberhash ;
my $recurring ;
for my $start (0 .. 7 ) {
  my $rest = 14 - $start ;
  for my $chunk (1 .. int( $rest / 2 ) ) {
      %numberhash = createPieceHash( substr( $fractional , $start) , $chunk ) ;
      if ( scalar (keys %numberhash ) == 1 ) {
    my @keys = keys %numberhash ;
    $recurring = $keys[ 0 ] ;
    last ;
      }
  }
}
if ( defined $recurring ) {
  my $pos = index( $fractional , $recurring ) ;
  if ( $recurring !~ /^0+$/ ) {
      if ( $pos != 0 ) {
    $fractional = substr( $fractional , 0 , $pos ) . "(" . $recurring .
        ")" ;
      }
      else {
    $fractional = "(" . $recurring . ")" ;
      }
  }
  else {
      $fractional = substr( $fractional, 0 , $pos ) ;
  }
}
say ($whole . "." . $fractional) ;
