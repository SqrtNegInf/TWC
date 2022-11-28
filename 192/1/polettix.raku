#!/usr/bin/env raku

sub MAIN ($n = 2⁶⁴ + 1) { put binary-flip($n) }

sub binary-flip (Int $n is copy where * > 0) {
   my $mask = 0x01;
   my $result = 0;
   while $n {
      $result +|= $mask unless $n +& 1;
      $n +>= 1;
      $mask +<= 1;
   }
   return $result;
}
