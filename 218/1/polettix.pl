#!/usr/bin/env perl
use v5.36;

say maximum_product( ( -8,  2, -9,  0, -4, 3) );

sub maximum_product (@list) {
   @list = sort { $a <=> $b } @list;
   my $below = $list[0] * $list[1] * $list[-1];
   my $above = $list[-3] * $list[-2] * $list[-1];
   return $below > $above ? $below : $above;
}
