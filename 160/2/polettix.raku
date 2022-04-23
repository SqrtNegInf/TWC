#!/usr/bin/env raku

sub MAIN (@args = [1, 3, 5, 7, 9 ]) { put equilibrium-index(@args) }

sub equilibrium-index (@n) {
   my $i_lo = 0;
   my $i_hi = @n.end;
   my $diff = 0;
   $diff += ($diff <= 0 ?? @n[$i_lo++] !! -@n[$i_hi--]) while $i_lo < $i_hi;
   return @n && $diff == 0 ?? $i_lo !! -1;
}
