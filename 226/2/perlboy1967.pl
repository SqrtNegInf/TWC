#!/usr/bin/env perl
use v5.16;

use common::sense;

use Test::More;

sub zeroArray (@) {
  @_ = grep {$_ > 0} sort {$a <=> $b} @_;
  my $n = 0;
  while (@_) {
    my $i = shift;
    @_ = grep {$_ > 0} map {$_ -= $i} @_;
    $n++;
  }
  return $n;
}

is(zeroArray(1,5,0,3,5),3);
is(zeroArray(0),0);
is(zeroArray(2,1,4,0,3),4);

done_testing;
