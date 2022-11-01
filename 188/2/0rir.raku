#!/usr/bin/env raku

use Test;

sub both-zero( Any(Int) $xorig where * > 0,
               Any(Int) $y is copy where * > 0,
               Bool :$return                    # Don't die, return 0.
           --> Real) {
    my Real $count = 0e0;
    my $x = $xorig;

    loop {
        when $x + $y == 0 { return $count; }
        if $return {
            when $y < $x < 0 { return 0; }
            when $x > 0  > $y and $x < $y.abs { return 0; }
        } else {
            when $y < $x < 0 { die 'divergent x runs down' }
            when $x > 0  > $y and $x < $y.abs { die 'divergent x runs up' }
        }
        when $x + $y ≠ 0 {
        when $x < $y { $y -= $xorig; ++ $count; }
        when $x > $y { $x -= $y;    ++ $count; }
            when $x == $y {
                if $y - $xorig == - $x {
                    $y -= $xorig;
                } else {
                    $x -=  $y;
                }
                ++ $count;
            }
        }
    }
}

multi MAIN ( ) {
    my @Test =

        { x => 20, y => 20, exp => 2, },
        { x => 2, y => 2, exp => 2, },
        { x => 1, y => 1, exp => 2, },
        { x => 1, y => 2, exp => 3 },
        { x => 1, y => 3, exp => 4 },
        { x => 1, y => 4, exp => 5 },

        { x => 2, y => 1, exp => 2 },
        { x => 3, y => 1, exp => 5, },  # 3
        { x => 4, y => 1, exp => 6 },

        { x => 2, y => 5, exp => 4, },
        { x => 4, y => 6, exp => 3, },
        { x => 5, y => 4, exp => 2, },  # 5
        { x => 7, y => 4, exp => 2, },  # 5
        { x => 12, y => 2, exp => 8, },
        { x => 19, y => 17, exp => 2, },
        { x => 19, y => 31, exp => 3, },
        { x => 31, y => 19, exp => 2, }, ;

    my @Dead = # divergent
        { x => 5, y => 2, exp => 0 },
        { x => 5, y => 7, exp => 0 },
        { x => 7, y => 2, exp => 0 },
        { x => 7, y => 3, exp => 0 },
        { x => 7, y => 9, exp => 0 },
        { x => 7, y => 10, exp => 0 },
        { x => 8, y => 3, exp => 0 },
        { x => 9, y => 2, exp => 0 },
        { x => 9, y => 4, exp => 0 },
        { x => 10, y => 3, exp => 0 },
        { x => 10, y => 4, exp => 0 },
        { x => 107, y => 10, exp => 0 }, ;

    plan +@Test + 2 × @Dead;
    for @Test -> %t {
        is both-zero( %t<x>, %t<y>, ), %t<exp>, "(%t<x>, %t<y>) -> %t<exp>";
    }
    for @Dead -> %t {
        dies-ok { both-zero( %t<x>, %t<y>, ) }, "(%t<x>, %t<y>) -> dead";
    }
    for @Dead -> %t {
        is both-zero( %t<x>, %t<y>, :return ), 0, "(%t<x>, %t<y>) -> 0";
    }
    done-testing;
}

