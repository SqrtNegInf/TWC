#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

use List::Util qw(min);

sub emptyArray (@) {
  my $n = 0;

  while (@_) {
    my $v = shift @_; push(@_,$v) if (min(@_,$v) != $v);
    $n++;
  }

  return $n;
}

is(emptyArray(3,4,2),5);
is(emptyArray(1,2,3),3);

done_testing;
