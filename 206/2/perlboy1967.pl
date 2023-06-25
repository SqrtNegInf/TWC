#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;

sub arrayPairings (@) {
  return if scalar @_ % 2; 

  my ($s,$i) = (0,0);
  my @l = sort { $a <=> $b } @_;
  while ($i < scalar(@l)) {
    $s += $l[$i]; $i += 2;
  } 

  return $s;
}

is(undef,arrayPairings(qw(1)));
is(4,arrayPairings(qw(1 2 3 4)));
is(2,arrayPairings(qw(0 2 1 3)));
is(4,arrayPairings(qw(1 1 1 2 2 2)));
is(3,arrayPairings(qw(0 0 1 1 2 2)));

done_testing;

