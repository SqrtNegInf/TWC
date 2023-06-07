#!/usr/bin/env perl
use v5.36;

sub swapLetters {
  my $word = shift ;
  my $firstPos = shift ;
  my $secondPos = shift ;
  my $temp = substr( $word , $secondPos , 1 ) ;
  substr( $word , $secondPos , 1 ) = substr( $word, $firstPos , 1 ) ;
  substr( $word , $firstPos , 1 ) = $temp ;
  return $word ;
}

my($word , $C, $O)= ('perlandraku', 3, 4);
my $len = length $word ;
for my $i ( 1..$C ) {
  $word = swapLetters( $word , $i % $len , ( $i + $O ) % $len ) ;
}
say $word ;
