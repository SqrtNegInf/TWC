#!/usr/bin/env raku
# Raku truncates leading zeros? That's neat.
# I was going to do that manually :-)

unit sub MAIN(Int $N is copy = -1700);

$N = $N.abs.flip * $N.sign;

my \MAX = 2**31;

say $N ~~ -MAX .. MAX-1 ?? $N !! 0;
