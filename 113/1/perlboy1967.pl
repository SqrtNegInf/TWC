#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0 sum);

use Test::More;

my @tests = (
  [13,1,0], [ 1,1,1],
  [15,2,0], [14,2,1],
  [17,3,0], [16,3,1],
  [19,4,0], [18,4,1],
  [21,5,0], [20,5,1],
  [23,6,0], [22,6,1],
  [25,7,0], [24,7,1],
  [27,8,0], [26,8,1],
  [29,9,0], [28,9,1],
);

foreach my $test (@tests) {
  my ($N,$D,$result) = @$test;
  is(isRepresentInteger($N,$D), $result);
}

done_testing;

sub isRepresentInteger {
  my ($n,$d) = @_;

  return ($n == sum0(grep /$d/, ($d .. $n)) ? 1 : 0);
}

