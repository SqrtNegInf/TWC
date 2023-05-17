#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
  [   3,  5, '3/5 3/2 1/2 1/1' ],
  [   4,  3, '4/3 1/3 1/2 1/1' ],
  [ 101, 45, '101/45 56/45 11/45 11/34 11/23 11/12 11/1 10/1 9/1 8/1 7/1 6/1 5/1 4/1 3/1 2/1 1/1' ],
  [   6,  4, '6/4 2/4 2/2 0/2' ], ## Not part of tree - but need to see what it does!
);

is( stringify( tree($_->[0],$_->[1]) ), $_->[2] ) foreach @TESTS;

done_testing();

sub tree {
  my @tr=[my($n,$d)=@_];
  push@tr,$d>$n?[$n,$d-=$n]:[$n-=$d,$d]while$n*$d>1;
  \@tr;
}

sub stringify {
  "@{[map{join'/',@{$_}}@{$_[0]}]}";
}

