#!/usr/bin/env raku

use Test;

is 4,  equal-distribution <1 0 5>;
is -1, equal-distribution <0 2 0>;
is 2,  equal-distribution <0 3 0>;

done-testing;

sub equal-distribution(@list) {
  $_ = @list».Int.Array;
  return -1 if .sum !%% .elems;
  my \mean-element = .sum div .elems;
  my $count = 0;
  while $_ > 1 {
    my \difference = .shift - mean-element;
    .[0] += difference;
    $count += difference.abs
  }
  $count
}

