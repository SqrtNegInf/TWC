#!/usr/bin/env raku

unit sub MAIN (@nums where @nums.elems >= 2 && all(@nums) ~~ /^<[0..9]>*$/ = (1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19));

if    [<=] @nums { say 1; }
elsif [>=] @nums { say 1; }
else             { say 0; }
