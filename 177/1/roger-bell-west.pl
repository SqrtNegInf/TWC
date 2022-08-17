#!/usr/bin/env perl

use strict;
use warnings;
use experimental 'signatures';

use Test::More tests => 2;

is(checkdamm(5724), 1, 'example 1');
is(checkdamm(5727), 0, 'example 2');

sub damm($n) {
  my @tab = (
    [0,3,1,7,5,9,8,6,4,2],
    [7,0,9,2,1,5,4,8,6,3],
    [4,2,0,6,8,7,1,3,5,9],
    [1,7,5,0,9,8,3,4,2,6],
    [6,1,2,3,0,4,5,9,7,8],
    [3,6,7,4,2,0,9,5,8,1],
    [5,8,6,9,7,2,0,1,3,4],
    [8,9,4,5,3,6,2,0,1,7],
    [9,4,3,8,6,1,7,2,0,5],
    [2,5,8,1,4,3,6,7,9,0],
      );
  my $c = 0;
  foreach my $digit (split '',$n) {
    $c = $tab[$c][$digit];
  }
  return $c;
}

sub checkdamm($n) {
  return (damm($n)==0)?1:0;
}
