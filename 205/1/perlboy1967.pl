#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

sub nHighest ($@) {
  my $n = shift; return (sort {$a <=> $b} @_)[scalar @_ >= $n ? -$n : -1];
}

is(3,nHighest(3,5,3,4));
is(6,nHighest(3,5,6));
is(4,nHighest(3,5,4,4,3));
is(0,nHighest(3,0,0,0,0));
is(9,nHighest(3,9));
is(undef,nHighest(3));

done_testing;
