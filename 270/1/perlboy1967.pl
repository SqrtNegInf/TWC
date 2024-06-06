#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

# Task 1
sub specialPositions ($ar) {
  sub _isSpecial (@ints) {
    my %i; $i{$_}++ for (@ints); 
    return (keys %i == 2 && $i{1} == 1 && exists $i{0} ? 1 : 0);
  }
  my @r = map { _isSpecial(@$_) } @$ar;
  my @c = map { my $c = $_; 
                _isSpecial(map{$$ar[$_][$c]} 0 .. $#{$$ar[0]})
              } 0 .. $#$ar;
  my $n = 0;
  for my $r (0 .. $#r) {
    for my $c (0 .. $#c) {
      $n++ if $$ar[$r][$c] & $r[$r] & $c[$c];
    }
  }
  return $n;
}

is(specialPositions([[1,0,0,],
                     [0,0,1,],
                     [1,0,0]]),1,'Example 1');
is(specialPositions([[1,0,0],
                     [0,1,0],
                     [0,0,1]]),3,'Example 2');
done_testing;
