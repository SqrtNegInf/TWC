#!/usr/bin/env perl

use v5.32;
use feature qw(signatures);
use common::sense;

use Test2::V0 -srand => 1;

sub maximumPairs(@words) {
  my ($n,%w) = (0);

  for (@words) {
    $n++ if exists $w{reverse $_};
    $w{$_}++;
  }

  return $n;
}

is(maximumPairs(qw(ab de ed bc)),1);
is(maximumPairs(qw(aa ba cd ed)),0);
is(maximumPairs(qw(uv qp st vu mn pq)),2);

done_testing;
