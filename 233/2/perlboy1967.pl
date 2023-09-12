#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;
use Test::Deep qw(cmp_deeply);

sub frequencySort (@) {
  my %f;
  $f{$_}++ for (@_);

  map {($_) x $f{$_}} sort { $f{$a} <=> $f{$b} or $b <=> $a } keys %f;
}

cmp_deeply([frequencySort(1,1,2,2,2,3)],
           [3,1,1,2,2,2]);
cmp_deeply([frequencySort(2,3,1,3,2)],
           [1,3,3,2,2]);

done_testing;
