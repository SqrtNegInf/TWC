#!/usr/bin/env perl
use v5.36;
use Test::More;

my @TESTS = (
  [ 5, 4, 5 ],
  [ 4, 6, 3 ],
  [ 2, 5, 4 ],
  [ 3, 1, 3 ],
  [ 5, 4, 5 ],
  [ 130504, 510, 276 ],
);

is( total_zero( $_->[0], $_->[1] ), $_->[2] ) for @TESTS;
is( total_one_step(   $_->[0], $_->[1] ), $_->[2] ) for @TESTS;

done_testing();

## We could just do the steps one at a time - but note
## that we can repeat one of the steps multiple times
## if $a >= $n.$b we can repeat the $a - $b $n times
## before we have to swap $a & $b over...

sub total_zero {
  my($t,$x,$y) = (0,@_);
  $x>$y ? ($t+=int($x/$y),$x%=$y) : ($t+=int($y/$x),$y%=$x) while $x&&$y;
  $t
}

sub total_one_step {
  my($t,$x,$y) = (0,@_);
  $x>$y ? ($t++,$x-=$y) : ($t++,$y-=$x) while $x&&$y;
  $t
}
