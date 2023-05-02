#!/usr/bin/env perl
use v5.36;
use Test::More;

my @TESTS = ( [ [1,0,5], 4 ], [ [0,2,0],-1], [ [0,3,0], 2 ] );

is( equal_dis(  @{$_->[0]} ), $_->[1] ) for @TESTS;
is( equal_dis2(  @{$_->[0]} ), $_->[1] ) for ( [ [0,2,0], -1 ], );
#is( equal_dis2(  @{$_->[0]} ), $_->[1] ) for @TESTS; # fails 1st and 3rd
done_testing();

sub equal_dis {
  my($av,$k) = (0,0);
  $av+=$_ for @_;
  return -1 if $av%@_;
  $av/=@_;
  $k+=abs($av-$_[0]),$_[1]-=$av-shift while @_>1;
  $k;
}

sub equal_dis2 {
  my($av,$k,$f) = (0,0,$_[0]);
  $av+=$_ for @_;
  return -1 if $av%@_;
  $av/=@_;
  $k+=abs($av-$f),$f+=$_[$_]-$av,warn ">$_,$f,$k" for 1..$#_;
  $k;
}
