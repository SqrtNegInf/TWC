#!/usr/bin/env raku

sub make_sum(Int $s where * > 0) {
    $s ~ ' ' ~
    $s.base(2).flip.comb[0..*-2].map({ ($_ eq '0') ?? '/2' !! '-1 /2' }).join(' ')
    ~ ' =1'
}

say make_sum((@*ARGS) ?? (@*ARGS[0].Int) !! (200))
