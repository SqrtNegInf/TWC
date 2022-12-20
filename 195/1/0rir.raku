#!/usr/bin/env raku

use Test;

constant @special-int-ct = gather { 
    take Nil;
    loop {
        state ( $i, $prev) = 0, 0;
        ++$i;
        take $i.Str.comb.elems == $i.Str.comb.unique.elems ?? ++$prev !! $prev;
    }
}

#multi MAIN ( 'test' ) {
    my @Test =
        { in =>  15,        exp =>      14, },
        { in =>  35,        exp =>      32, },
        { in =>  99,        exp =>      90, },
        { in =>  200,       exp =>     162, },
        { in =>  180,       exp =>     147, },
        { in =>  1_000,     exp =>     738, },
        { in =>  10_000,    exp =>   5_274, },
        { in =>  100_000,   exp =>  32_490, },
        { in =>  1_000_000, exp => 168_570, },
    ;
    plan +@Test;
    for @Test -> %t {
        is @special-int-ct[%t<in>], %t<exp>, " %t<exp> <- 1..%t<in>";
    }
    done-testing;
#}

#multi MAIN( $n = 180) { say "Input: \$n = 180\nOutput: @special-int-ct[$n]"; }
