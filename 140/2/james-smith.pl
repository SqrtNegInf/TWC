#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
  [ [2,3,1], 1 ],
  [ [2,3,2], 2 ],
  [ [2,3,3], 2 ],
  [ [2,3,4], 3 ],
  [ [2,3,5], 4 ],
  [ [2,3,6], 6 ],
  [ [3,3,6], 4 ],
);

is( get_num(@{$_->[0]}), $_->[1] ) for @TESTS;
is( get_num_exp(@{$_->[0]}), $_->[1] ) for @TESTS;

done_testing();

sub get_num {
  my$t;
  (sort{$a<=>$b}map{++$t;map{$t*$_}1..$_[0]}1..$_[1])[$_[2]-1];
}

sub get_num_exp {
  my($i,$j,$k,@A) = @_;
  foreach my $t (1..$j) {
    push @A,map{$t*$_} 1..$i;
  }
  @A = sort @A;
  return $A[ $k-1 ];
}
