#!/usr/bin/env perl
use v5.36;

sub integer_square_root ($n) {
   return $n if $n < 2;
   my $x = $n >> 1;  # first estimate
   my $y = $x + 1;   # just to get started with $x < $y
   ($x, $y) = (($x + int($n / $x)) >> 1, $x) while $x < $y;
   return $y;
}
say integer_square_root(shift // 10);
