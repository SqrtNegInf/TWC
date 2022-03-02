#!/usr/bin/env perl

use strict;

use warnings;
use feature qw(say);
use Test::More;

my @TESTS = (
  [ [2, 5, 4, 4, 5, 5, 2], 5 ],
  [ [1, 2, 3, 4, 3, 2, 1, 4, 4], 4 ],
);

is( find_odd_not($_->[0]), $_->[1] ) foreach @TESTS;
is( find_odd_xor($_->[0]), $_->[1] ) foreach @TESTS;
is( find_odd_sum($_->[0]), $_->[1] ) foreach @TESTS;

done_testing();

sub find_odd_sum {
  my %x;
  $x{$_}++ foreach @{$_[0]};
  return ( grep { $x{$_} & 1 } keys %x )[0];
}

sub find_odd_xor {
  my %x;
  $x{$_}^=1 foreach @{$_[0]};
  return ( grep { $x{$_} } keys %x )[0];
}

sub find_odd_not {
  my %x;
  $x{$_} = !$x{$_} foreach @{$_[0]};
  return ( grep { $x{$_} } keys %x )[0];
}

