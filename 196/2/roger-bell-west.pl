#!/usr/bin/env perl

use v5.36;
use Test::More tests => 3;

is_deeply(rangelist([1, 3, 4, 5, 7]), [[3, 5]], 'example 1');
is_deeply(rangelist([1, 2, 3, 6, 7, 9]), [[1, 3], [6, 7]], 'example 2');
is_deeply(rangelist([0, 1, 2, 4, 5, 6, 8, 9]),
          [[0, 2], [4, 6], [8, 9]], 'example 3');

sub rangelist($l) {
  my @o;
  my $start = $l->[0];
  my $prev = $start;
  foreach my $v (@{$l}[1..$#{$l}]) {
    if ($v != $prev + 1) {
      if ($prev > $start) {
        push @o, [$start, $prev];
      }
      $start = $v;
    }
    $prev = $v;
  }
  if ($prev > $start) {
    push @o, [$start, $prev];
  }
  return \@o;
}
