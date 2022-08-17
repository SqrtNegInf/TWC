#!/usr/bin/env raku

use Test;

my @exp = 101, 16061, 31013, 35053, 38083, 73037, 74047, 91019, 94049,
1120211, 1150511, 1160611, 1180811, 1190911, 1250521, 1280821,
1360631, 1390931, 1490941, 1520251;

constant @palindomic-cyclopiac-prime = gather for 10, 20…∞ -> $s {
    my $c = $s ~ $s.flip.Int;
    take $c if $c.is-prime; 
}

my @pcp = @palindomic-cyclopiac-prime.head(20);

say "Output\n@pcp.head(20).join(', ')";

die "Failed" unless @pcp.head(20) == @exp;
