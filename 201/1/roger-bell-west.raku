#!/usr/bin/env raku

sub missingnumber(@l) {
  my $v = set(@l);
  for (0..@l.elems) -> $i {
    unless ($v{$i}:exists) {
      return $i;
    }
  }
  return 0;
}

use Test;

plan 2;

is(missingnumber([0, 1, 3]), 2, 'example 1');
is(missingnumber([0, 1]), 2, 'example 2');
