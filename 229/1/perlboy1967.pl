#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

sub lexicographicOrder (@) {
  return scalar grep {
    my @c = sort split //, $_;
    (join('',@c) ne $_ and join('',reverse @c) ne $_) ? 1 : 0;
  } @_;
}

is(lexicographicOrder(qw(abc bce cae)),1);
is(lexicographicOrder(qw(yxz cba mon)),2);

done_testing;
