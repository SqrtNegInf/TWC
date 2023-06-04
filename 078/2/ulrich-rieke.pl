#!/usr/bin/env perl
use v5.36;

sub leftRotate {
  my $array = shift ;
  my $rotateBy = shift ;
  my $len = scalar @$array ;
  my @rotated ;
  if ( $rotateBy > $len - 1 ) {
      return 0 ; #invalid operation, index too great
  }
  else {
      my @subarray = @$array[$rotateBy .. $len - 1] ;
      push( @rotated , @subarray ) ;
      @subarray = @$array[0 .. $rotateBy - 1] ;
      push( @rotated , @subarray ) ;
      return @rotated ;
  }
}

my @array = (10,20,30,40,50); my @indices = (3,4);
for my $index ( @indices ) {
  my @rotated = leftRotate( \@array , $index ) ;
  my $line = '(' . join( " " , @rotated ) . ')' ;
  say $line ;
}
