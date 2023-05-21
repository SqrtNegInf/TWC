#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
  [ [3,3], 6 ],
  [ [5,5], 14 ],
);

is( distinct_terms(@{$_->[0]}), $_->[1] ) foreach @TESTS;

done_testing();

sub distinct_terms {
  my($m,$n,%x) = @_;
  for my $i (1..$m) {
    $x{$i*$_}++ for 1..$n;
  }
  return scalar keys %x;
}

