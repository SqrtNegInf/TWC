#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Test::More;

my @TESTS = (
 [ [[2,1],[4,5]],4],
 [ [[1,0,3],[0,0,0],[1,2,1]],0],
 [ [[3,1,2],[5,2,4],[0,1,3]],1],
 [ [[reverse 5..9],[reverse 2..6],[reverse 3..7],[reverse 4..8],[reverse 1..5]],2],
 [ [[reverse 7..13],[reverse 2..8],[reverse 3..9],[reverse 4..10],[reverse 5..11],[reverse 6..12],[reverse 1..7]],2],
 [ [
[ 7,9,4,5,6,5,6,8,1,9 ],
[ 6,2,8,8,6,2,1,9,2,7 ],
[ 9,7,1,5,8,8,3,5,6,5 ],
[ 9,1,6,4,4,4,5,9,5,5 ],
[ 4,4,9,8,4,2,6,4,3,6 ],
[ 7,4,4,4,3,1,9,8,8,9 ],
[ 5,8,6,8,1,8,3,8,8,2 ],
[ 7,4,7,9,3,7,2,5,7,4 ],
[ 6,4,9,1,8,5,7,4,7,6 ],
[ 0,2,3,0.5,0.25,0.1,4,3,1,4]], 0.25
],
 [ [
[ 8,1,5,6,1,6,4,5,2,9,3,4,4,1,3,2,4,6,4,6,3,5,2,7,9,9,3,2,1,5 ],
[ 9,9,4,4,3,9,7,3,4,1,7,9,3,2,4,6,4,7,4,9,2,8,1,9,3,5,4,4,2,3 ],
[ 8,2,3,6,2,7,3,1,4,6,4,7,7,8,6,6,9,8,9,1,3,8,4,7,5,7,2,6,9,7 ],
[ 3,4,1,3,5,2,2,8,3,7,8,8,5,7,5,5,6,3,5,7,4,7,6,4,1,1,5,5,2,6 ],
[ 5,4,5,3,1,2,9,2,1,8,1,7,2,4,8,7,3,7,1,6,9,8,3,1,4,8,6,7,9,8 ],
[ 9,7,9,6,8,8,9,1,1,3,6,1,4,4,8,3,6,1,8,7,3,4,3,3,8,6,8,2,8,3 ],
[ 9,7,5,5,6,4,4,8,3,5,2,9,9,6,4,5,9,4,4,6,9,5,6,8,3,5,4,7,3,7 ],
[ 4,2,7,1,9,4,5,1,9,4,1,1,4,1,8,6,9,6,1,3,2,8,3,8,7,2,8,5,9,8 ],
[ 8,8,4,8,2,3,7,5,2,8,9,2,8,1,7,9,4,2,3,2,9,4,7,6,3,8,8,3,7,4 ],
[ 1,1,4,5,3,5,4,2,4,6,7,1,3,1,8,7,6,3,9,7,7,9,1,7,2,9,5,5,6,4 ],
[ 3,3,8,8,5,2,4,9,7,7,8,4,3,6,5,7,6,6,7,2,7,5,7,3,3,5,8,8,8,4 ],
[ 5,5,3,7,9,2,9,6,7,5,2,1,9,4,4,9,6,4,8,1,5,3,6,8,1,3,4,8,6,6 ],
[ 1,9,4,5,5,2,7,1,3,7,9,7,1,8,3,1,2,6,6,6,2,1,8,8,6,6,7,8,9,9 ],
[ 1,1,7,6,3,8,4,4,3,6,9,4,5,1,4,7,6,1,6,2,5,9,3,2,1,3,7,4,3,9 ],
[ 8,3,7,5,7,8,5,6,1,4,1,2,4,9,4,6,3,6,8,5,9,2,2,2,3,7,6,8,8,9 ],
[ 3,3,9,8,2,2,1,3,6,5,7,1,3,5,1,4,3,7,4,5,8,4,3,5,3,7,4,9,1,6 ],
[ 7,2,4,1,6,1,8,2,4,5,1,9,6,3,7,5,3,1,2,6,7,8,6,6,2,8,9,7,4,6 ],
[ 5,2,3,9,5,6,3,5,7,8,9,1,4,8,5,1,8,6,2,3,6,6,2,8,3,6,8,6,8,1 ],
[ 1,1,7,9,3,8,4,3,8,7,3,2,9,3,3,2,7,1,2,2,2,8,9,3,3,5,6,8,7,5 ],
[ 8,6,8,7,4,5,7,1,5,6,1,5,1,9,9,8,8,1,1,4,1,6,1,5,4,9,2,6,1,6 ],
[ 9,2,1,5,5,8,9,6,4,2,6,2,2,6,3,3,2,4,5,9,2,2,9,5,5,4,5,8,7,4 ],
[ 6,9,6,6,2,7,5,8,5,9,8,9,9,4,9,5,2,7,3,3,4,2,2,6,5,8,6,6,2,3 ],
[ 9,6,2,7,8,4,4,3,5,8,8,2,6,4,1,7,8,2,1,1,3,9,3,5,9,1,7,1,4,9 ],
[ 2,3,8,1,4,3,3,6,9,8,9,1,3,6,9,4,5,2,1,1,6,3,2,9,1,6,9,1,5,2 ],
[ 4,8,6,9,5,4,3,5,3,9,4,6,1,5,9,8,4,5,4,5,7,3,8,3,9,9,3,4,7,8 ],
[ 6,3,1,3,1,8,4,5,7,7,8,6,8,5,5,6,4,9,1,7,3,9,1,8,6,9,7,4,1,6 ],
[ 5,3,6,3,8,6,7,1,1,9,7,7,3,2,2,5,5,4,5,2,3,1,7,6,1,1,8,3,6,7 ],
[ 8,2,2,6,6,1,6,3,9,1,9,1,4,5,2,9,2,9,4,4,7,6,3,2,7,9,7,6,5,6 ],
[ 4,9,7,7,5,1,4,9,2,6,4,8,6,7,5,6,3,8,2,9,7,5,3,1,3,4,7,6,7,1 ],
[ 1,2,3,1,0,1,2,0.5,0,1,2,1,3,5,6,1,4,9,1,2,3,0.2,0.1,0.05,1,4,5,1,9,10] ], 0.05 ],
[ [
[ 3,4,4,3,1,4,1,4,5,3,3,1,5,2,5,7,1,2,4,6 ],
[ 1,2,4,6,2,6,8,8,3,1,1,4,3,3,4,7,4,1,2,8 ],
[ 6,2,8,4,7,1,9,8,7,2,2,5,8,9,8,3,4,5,4,5 ],
[ 9,2,9,8,7,6,7,7,2,3,8,4,1,3,5,3,9,4,6,5 ],
[ 5,9,1,1,8,6,9,4,2,6,5,5,4,9,5,9,9,2,3,8 ],
[ 9,5,2,6,2,4,4,1,3,1,2,5,8,9,3,5,2,4,3,8 ],
[ 9,7,5,8,6,1,4,6,1,8,9,9,4,1,8,1,2,3,4,4 ],
[ 1,2,7,9,3,3,4,8,3,9,9,6,6,7,9,9,8,1,5,7 ],
[ 5,1,2,2,1,9,9,1,9,7,6,6,1,3,5,2,1,2,7,8 ],
[ 8,5,2,2,4,8,7,5,5,7,2,8,1,2,9,8,7,7,1,4 ],
[ 9,8,9,5,6,1,5,5,4,4,1,9,9,3,7,7,4,3,9,6 ],
[ 7,5,6,5,2,9,8,7,9,4,2,8,8,2,8,4,9,8,4,1 ],
[ 4,1,2,4,9,9,6,6,3,3,9,8,1,3,6,9,5,7,5,5 ],
[ 4,6,2,6,5,2,1,6,4,3,9,7,7,3,9,9,9,3,7,9 ],
[ 6,8,5,2,9,9,9,9,4,6,9,9,9,7,2,1,8,3,3,1 ],
[ 2,4,1,1,5,2,3,7,8,9,7,4,1,3,7,2,3,6,5,1 ],
[ 9,1,9,3,9,8,7,8,5,3,7,5,1,1,2,3,2,9,9,3 ],
[ 9,8,2,5,1,5,7,7,9,3,7,1,7,7,1,2,1,6,9,4 ],
[ 6,4,3,6,3,3,3,3,8,5,1,4,2,6,4,3,8,1,5,7 ],
[ 0,1,3,1,0.5,0.25,0.1,1,3,4,5,6,9,0.05,1,3,4,5,6,7]],0.1 ],
);

sub sorted_matrix {
  [ sort { $a <=> $b } map {@{$_}} @_ ]->[2]
}

sub sorted_matrix_x {
  @_=map{ @{$_} } @_;

  my( $x, $y ,$z ) = splice @_,0,3; ## Grab 3 values;

  ( $x, $y     ) = ( $y, $x ) if $y<$x;
  $z < $x ? ($x,$y,$z) = ($z,$x,$y) : $z < $y && ( ($y,$z)=($z,$y) );

  $_<$z && (
      $_<$x ?  ( $x, $y, $z ) = ( $_, $x, $y )
    : $_<$y ?  (     $y, $z ) = (     $_, $y )
    :          (         $z   =           $_ )
  ) for @_;
  $z
}

sub sorted_matrix_xx {
  my @row = @{pop()};

  my $x = pop @row; @row = @{pop()} unless @row;
  my $y = pop @row; @row = @{pop()} unless @row;
  my $z = pop @row;

  ( $x, $y     ) = ( $y, $x ) if $y<$x;
  $z < $x ? ($x,$y,$z) = ($z,$x,$y) : $z < $y && ( ($y,$z)=($z,$y) );
  for(\@row,@_) {
    $_<$z && (
        $_<$x ?  ( $x, $y, $z ) = ( $_, $x, $y )
      : $_<$y ?  (     $y, $z ) = (     $_, $y )
      :          (         $z   =           $_ )
    ) for @{$_};
  }
  $z;
}

is( sorted_matrix(    @{$_->[0]} ) , $_->[1] ) for @TESTS;
is( sorted_matrix_x(  @{$_->[0]} ) , $_->[1] ) for @TESTS;
is( sorted_matrix_xx( @{$_->[0]} ) , $_->[1] ) for @TESTS;

done_testing();
