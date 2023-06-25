#!/usr/bin/env perl
use v5.36;
use experimental qw< bitwise signatures >;

say maximum_xor((13,13,9,1));

sub maximum_xor (@array) {
   my $max = 0;
   for my $i (0 .. $#array - 1) {
      for my $j ($i + 1 .. $#array) {
         my $xor = $array[$i] ^ $array[$j];
         $max = $xor if $xor > $max;
      }
   }
   return $max;
}
