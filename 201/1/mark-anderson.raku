#!/usr/bin/env raku

sub missing-numbers(*@a)
{
    ((0..@a) (-) @a).keys.sort
}

use Test;
is-deeply missing-numbers(0,1,3),      (2,);
is-deeply missing-numbers(0,1),        (2,);
is-deeply missing-numbers(2,3,8,2457), (0,1,4);
