#!/usr/bin/env perl

use strict;
use warnings;
use experimental 'signatures';

use Test::More tests => 3;

is(maxindex([5, 2, 9, 1, 7, 6]),2,'example 1');
is(maxindex([4, 2, 3, 1, 5, 0]),4,'example 2');
is(maxindex([4, 2, 3, 1, 4, 0]),0,'example 3');

sub maxindex($n) {
  my $mxv = 0;
  my $mxi = 0;
  foreach my $i (0..$#{$n}) {
    if ($i == 0 || $n->[$i] > $mxv) {
      $mxv = $n->[$i];
      $mxi = $i;
    }
  }
  return $mxi;
}
