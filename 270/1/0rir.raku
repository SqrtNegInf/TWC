#!/usr/bin/env raku

use Test;

my @Test =
    [ [1, 0, 0], [0, 0, 1], [1, 0, 0], ],  1,
    [ [1, 0, 0], [0, 1, 0], [0, 0, 1], ],  3,
    [ [1,],],                              1,
    [ [1,0],],                             1,
    [ [1,1],],                             0,
    [ [1,2],],                             0,
    [ [2,2],],                             0,
    [ [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], [0,0,0,0,0], ],  0,
    [ [0,0,0,0,0], [0,0,0,0,0], [0,0,1,0,0], [0,0,0,0,0], [0,0,0,0,0], ],  1,
    [ [1,0,0,0,0], [0,1,0,0,0], [0,0,1,0,0], [0,0,0,1,0], [0,0,0,0,1], ],  5,
    [ [1,0,0,0,0], [0,1,0,0,2], [0,0,1,0,0], [0,0,0,1,0], [0,0,0,0,1], ],  3,
;
plan @Test ÷ 2;

multi task( @a where *.end  ==  0        -->Int) {
        ( 1 == @a[0].grep( 1)  and  @a[0].end  == @a[0].grep(0) // 0 )  ??   1 !! 0;
}
multi task( @a -->Int) {
    my $ret = 0;
    my $columns = @a[0].elems;
    for ^@a -> \i {          # one one                   balance zeds
        next unless  1 == @a[i].grep( 1)  and  $columns - 1  == @a[i].grep( 0);
        my $col = @a[i].first: 1, :k;
        my @col := do @a[$_][$col] for ^@a;
        next unless  1 == @col.grep( 1);
        next unless $columns - 1  == @col.grep( 0);
        $ret += 1;
    }
    $ret;
}

for @Test -> @in, $exp {
    is task(@in), $exp, "$exp <- @in.raku()";
}

done-testing;
