#!/usr/bin/env perl
use v5.36.0;

use Test::More tests => 3;
use List::MoreUtils qw(minmax);

is(monotonicarray([1, 2, 2, 3]), 1, 'example 1');
is(monotonicarray([1, 3, 2]), 0, 'example 2');
is(monotonicarray([6, 5, 5, 4]), 1, 'example 3');

sub monotonicarray($l) {
  my @d;
  foreach my $i (0..$#{$l} - 1) {
    push @d, $l->[$i + 1] - $l->[$i];
  }
  my @mm = minmax(@d);
  return ($mm[0] * $mm[1] >= 0) ? 1 : 0;
}
