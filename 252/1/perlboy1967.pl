#!/usr/bin/env perl
use v5.36;

#use common::sense;

use Test2::V0 -srand => 1;

use List::Util qw(sum0);

sub specialNumbers (@ints) {
  my $n = $#ints + 1;
  sum0 map { $ints[$_ - 1] ** 2 } grep { $n % $_ == 0 } 1 .. $n;
}

is(specialNumbers(1,2,3,4),21);
is(specialNumbers(2,7,1,19,18,3),63);

done_testing;
