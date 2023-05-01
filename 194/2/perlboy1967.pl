#!/usr/bin/env perl

use v5.36;

use List::MoreUtils qw(frequency minmax);
use Test::More;

sub freqEqual :prototype($) {
  my %foo = reverse frequency split//,$_[0];
  my ($min,$max) = minmax keys %foo;
  return $min == $max-1 ? 1 : 0;
}

my %t = qw(abbc 1 xyzyyxz 1 xzxz 0);

for (sort keys %t) {
 is(freqEqual($_),$t{$_},"freqEqual('$_')");
}

done_testing;
