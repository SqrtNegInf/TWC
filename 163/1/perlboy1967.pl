#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use List::MoreUtils qw(singleton duplicates uniq);
use Algorithm::Combinatorics qw(combinations);
use Test::More;

is (andSum1(1,2,3), 3);
is (andSum2(1,2,3), 3);

is (andSum1(2,3,4), 2);
is (andSum2(2,3,4), 2);

is (andSum1(2,2), 2);
is (andSum2(2,2), 0);

is (andSum1(2,2,2), 2);
is (andSum2(2,2,2), 0);

is (andSum1(1), 0);
is (andSum2(1), 0);

is (andSum1(1,1,3), 3);
is (andSum2(1,1,3), 1);

done_testing();

# Assumption on andSum1:
#
# Unique combinations of (1,1,3) results in:
#
#    (1 & 1) + (1 & 3) + (3 & 1)
# 
# as left hand side and right hand side of the '&' is three time q unique combination
#
# Note: Add (0,0) to always have two harmless values in the list
sub andSum1 {
  return sum map{$_->[0]&$_->[1]}combinations([0,0,singleton(@_),map{($_)x2}duplicates(@_)],2);
}

# andSum2 is a more simplistic algorithm:
# Work on the unique numbers given (remove duplicates)
#
# Note: Add (0,0) to always have two harmless values in the list
sub andSum2 {
  return sum map{$_->[0]&$_->[1]}combinations([0,0,uniq@_],2);
}
