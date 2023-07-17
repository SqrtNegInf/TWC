#!/usr/bin/env raku

use Test;

my @int = 10, 4, 8, 3;

sub l-r-sum-diff( @a = [10, 4, 8, 3] -->Array) {
    my @l = 0, | do for 0..2        { [+] @a[0..$_]       }
    my @r =    | do for @a-3...@a-1 { [+] @a[@a.end...$_] }, 0;
    @     =    do for ^@l -> $i { abs( @l[$i] - @r[$i] ) }
}

say "Input: @int = @int.raku()\nOutput: " ~ l-r-sum-diff().raku;

