#!/usr/bin/env raku

use Test;

my @Test =
    # ary    ary      magic_num
    (3, 7, 5), (9, 5, 7), 2,
    (1, 2, 1), (5, 4, 4), 3,
    (2,), (5,), 3,
    (2,5), (2,5), 0,
    (2,5), (1,9), Int,
    (),    (),    Int,
;
my @Die =
    (1,0), (2,),
    (),    (1,2),
    (1,2), (),
;
plan @Test ÷ 3 + @Die ÷ 2;

multi func( @a where * ~~ [], @b where * ~~ [] --> Int ) { Int }
multi func( @a, @b where +* == +@a --> Int) {
    my @candi = (@a.sort [Z-] @b.sort);
    return (@candi.all == @candi[0])
           ?? @candi[0].Int.abs
           !! Int;
}

for @Test -> @a, @b, $exp {
    is func(@a, @b), $exp, ($exp // "(Int)") ~ " ~~\t @a[] <=- @b[]";
}

for @Die -> @a, @b {
    dies-ok { func(@a, @b) }, "die ~~\t @a[] <=- @b[]";
}
done-testing;

exit;

