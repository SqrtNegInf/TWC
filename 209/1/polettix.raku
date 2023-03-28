#!/usr/bin/env raku

sub MAIN ($bits = '1110') { put special-bits-characters($bits.comb.Array) }

sub special-bits-characters ($bits) {
   $bits.join('') ~~ m{^ [ 1 <[ 0 1 ]> | 0 ]* 0 $} ?? 1 !! 0;
}
