#!/usr/bin/env perl
use v5.36;

use common::sense;

use Test::More;

sub countWords ($@) {
  my ($l,$p) = (length $_[0], shift);

  return scalar grep { substr($_,0,$l) eq $p } @_;
}

is(countWords('at', 'pay','attention','practice','attend'),2);
is(countWords('ja', 'janet','julia','java','javascript'),3);

done_testing;
