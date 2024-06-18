#!/usr/bin/env raku

use Test;

my @Test =
    "aabb",     True,
    "abab",     False,
    "aaa",      False,
    "bbb",      True,
    "ccc",      False,
    "cbc",      True,
    "cac",      False,
    "cab",      True,
;
plan @Test ÷ 2;

sub task( $word) {
    my @w = $word.comb;
    without my $b-k =              @w.first( 'b', :k) { return False }
    with
                      @w[++$b-k..^@w].first( 'a')     { return False  }
    True;
}

for @Test -> $in, $exp {
    is task($in), $exp, "$exp\t<- $in";
}

done-testing;


