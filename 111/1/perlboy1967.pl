#!/usr/bin/env perl
use v5.36;

use List::BinarySearch qw(binsearch_pos);

use Data::Printer;
use Test::More;

# Prototype(s)
sub searchMatrix :prototype(\@$);

my @m = (
  [  1,  2,  3,  5,  7 ],
  [  9, 11, 15, 19, 20 ],
  [ 23, 24, 25, 29, 31 ],
  [ 32, 33, 39, 40, 42 ],
  [ 45, 47, 48, 49, 50 ],
);

is (searchMatrix(@m,35),0);
is (searchMatrix(@m,39),1);

done_testing;


sub searchMatrix :prototype(\@$) {
  my ($arM,$i) = @_;

  # Flatten matrix to ordered list
  my @l = map {@$_} @$arM;

  return ($l[binsearch_pos {$a<=>$b} $i, @l] == $i ? 1 : 0);
}

