#!/usr/bin/env perl
use v5.36.0;

use Test::More;

my @TESTS = (
  [ [1,2,3,4], 4 ],
  [ [0,2,1,3], 2 ],
);

is( max_sum_pair_min( @{$_->[0]} ), $_->[1] ) for @TESTS;
done_testing();

sub max_sum_pair_min {
  my $t = 0, @_ = sort {$a<=>$b} @_;
  $t += shift, shift while @_;
  $t
}
