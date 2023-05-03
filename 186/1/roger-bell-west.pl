#!/usr/bin/env perl
use v5.36;
use Test::More tests => 1;

use List::AllUtils qw(mesh);

is_deeply(zip([1, 2, 3], ["a", "b", "c"]),
          [1, "a", 2, "b", 3, "c"],
          'example 1');

sub zip($a, $b) {
  return [mesh(@{$a}, @{$b})];
}
