#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand => 1;

sub isXmatrix ($ar) {
  my $d = scalar @$ar-1;
  my ($x1,$x2) = (0,$d);
  for my $y (0 .. $d) {
    for my $x (0 .. $d) {
      if ($x == $x1 or $x == $x2) {
        return 0 if $ar->[$y][$x] == 0;
      } elsif ($ar->[$y][$x] != 0) {
        return 0;
      }
    }
    $x1++; $x2--;
  } 
  return 1;
}

is(isXmatrix([[1,0,0,2],[0,3,4,0],
              [0,5,6,0],[7,0,0,1]]),1,'Example 1');
is(isXmatrix([[1,2,3],[4,5,6],[7,8,9]]),0,'Example 2');
is(isXmatrix([[1,0,2],[0,3,0],[4,0,5]]),1,'Example 3');

done_testing;
