#!/usr/bin/env perl
use v5.36;

use common::sense;

use List::Util qw(max);
use List::MoreUtils qw(uniq);
use Algorithm::Combinatorics qw(combinations);

use Test::More;

sub maXor ($@) {
  my @l = uniq(@_); return max(map { $$_[0] ^ $$_[1] } combinations(\@l,2));
}

is(7,maXor(1,2,3,4,5,6,7));
is(7,maXor(2,4,1,3));
is(15,maXor(10,5,7,12,8));

done_testing;
