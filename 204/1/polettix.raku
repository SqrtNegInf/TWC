#!/usr/bin/env raku

sub MAIN (@args=(1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19)) { put monotonic-array(@args) ?? 1 !! 0 }

sub monotonic-array (@array) {
   ([*] @array.rotor(2 => -1).map({[-] $_}).minmax[0, *-1]) >= 0
}
