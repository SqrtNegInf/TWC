#!/usr/bin/env raku

sub integer-square-root (Int:D $n where * >= 0) {
   return $n if $n < 2;
   my $x = $n +> 1;  # first estimate
   my $y = $x + 1;   # just to get started with $x < $y
   ($x, $y) = (($x + ($n / $x).Int) +> 1, $x) while $x < $y;
   return $y;
}
sub MAIN (Int:D $n where * >= 0 = 10) { put integer-square-root($n) }
