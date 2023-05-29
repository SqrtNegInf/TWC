#!/usr/bin/env raku

say maximum-product( ( -8,  2, -9,  0, -4, 3) );

sub maximum-product (@args) {
   my @sorted = @args».Int.sort;
   my $below = @sorted[0] * @sorted[1] * @sorted[* - 1];
   my $above = [*] @sorted.reverse[0..2];
   return ($below, $above).max;
}
