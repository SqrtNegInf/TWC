#!/usr/bin/env perl

use v5.36;
use Test::More tests => 5;

is(greatercharacter(['e', 'm', 'u', 'g'], 'b'), 'e', 'example 1');
is(greatercharacter(['d', 'c', 'e', 'f'], 'a'), 'c', 'example 2');
is(greatercharacter(['j', 'a', 'r'], 'o'), 'r', 'example 3');
is(greatercharacter(['d', 'c', 'a', 'f'], 'a'), 'c', 'example 4');
is(greatercharacter(['t', 'g', 'a', 'l'], 'v'), 'v', 'example 5');

sub greatercharacter($a, $k) {
  my @aa = sort grep {$_ gt $k} @{$a};
  if (@aa) {
    return $aa[0];
  } else {
    return $k;
  }
}
