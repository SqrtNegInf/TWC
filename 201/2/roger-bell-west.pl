#!/usr/bin/env perl
use v5.36.0;

use Math::Prime::Util qw(partitions);

use Test::More tests => 2;

is(pennypiles(5), 7, 'example 1');
is(pennypiles(10), 42, 'example 2');

sub pennypiles($n) {
  return partitions($n);
}
