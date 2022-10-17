#!/usr/bin/env raku

use Test;

sub zip( @l, @r --> List ) { List( [Z]  @l, @r); }

constant TEST=True;
if TEST {
    my @Test = {  l => <1 2 3>,
                  r => <a b c >,
                  lr => < 1 a 2 b 3 c>,
                  rl => < a 1 b 2 c 3>, },;

    plan 2 × @Test.elems;

    for @Test -> %t {
        is zip( %t<l>, %t<r>), %t<lr>, 'l r ';
        is zip( %t<r>, %t<l>), %t<rl>, 'r l ';
    }
    done-testing;
}

