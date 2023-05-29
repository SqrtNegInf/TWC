#!/usr/bin/env raku
use Test;

my @Test =
    # in                            exp
    (3, 1, 2),                            6,    # given
    (4, 1, 3, 2),                        24,
    (-8, 2, -9, 0, -4, 3),              216,
    (-1, 0, 1, 3, 1),                     3,

    (-2, 3, 5),                         -30,    # three elems

    ( 0,  1,  2,  3),                     6,    # quads
    ( 1,  2,  3,  4),                    24,
    (-3, -2, -1,  0),                     0,
    (-4, -3, -2, -1),                    -6,
    (-1,  1,  2,  3),                     6,
    (-1, -1, -2,  3),                     6,
    (-1, -1,  2,  3),                     3,
    (-3, -2,  3,  3),                    18,
    (-3, -3,  3,  3),                    27,

    ( 0,  1,  2,  3,  4),                24,    # all pos
    ( 1,  2,  3,  4,  5),                60,
    (-4, -3, -2, -1,  0),                 0,    # max zed
    (-5, -4, -3, -2, -1),                -6,    # all neg
    (-2, 0,  1,  2,   3),                 6,    # 1 neg
    (-2,  1,  2,  3,  4),                24,    # 1 neg
    (-2, -3, -1, -1,  4),                24,    # 1 pos

    (-1, -1,  2,  3,  4),                24,    # 2 neg
    (-3, -2,  1,  3,  3),                18,
    (-3, -2,  3,  3,  3),                27,
    (-3, -2,  1,  3,  3,  3),            27,

    (-2, -1, -1,  3,  4),                8,    # 2 pos
    (-3, -2, -1,  3,  3),               18,
    (-3, -2, -1, -1,  1,  2),           12,
    (-3, -2,  1,  3,  3,  3),           3³,

    (-9, -2, -2,  2,  3,  6),           108,   # default
    (-8, -4, -2,  2,  4,  9),           288,
    (-8, -4, -2,  5,  6,  9),           288,
    (-8, -4, -2,  5,  7,  9),           315,
    (-8, -5, -2,  5,  7,  9),           360,
    ;
plan @Test ÷ 2 + 1 + 1000;

multi max3prod( @a where *.elems  < 3) { die( 'oospec') }
multi max3prod( @a ) {
    multi func {…}
    return func @a.sort;

    multi func( @a where 0 ≤ *[0])     { [×] @a[*-3..*-1] }         # all pos
    multi func( @a where *[*-1] < 0)   { [×] @a[*-3..*-1] }         # all neg
    # mixed signs
    multi func( @a){ max ([×] @a[0,1,*-1]), ([×] @a[*-3..*-1]); }
}

for @Test -> @in, $exp {
    is max3prod(@in), $exp, "$exp\t<- @in.sort() sorted";
}
srand(102);
for 1..1_000 {
    my @t;
    for  1..4 + (^5).pick -> $l {
        for (^20).pick - 10 -> $r {
            @t.push: $r;
        }
    }
    my $res = @t.combinations(3).map( {[*] $_} ).max;       # brute
    is max3prod(@t), $res, "$res\t<- @t.sort() sorted";
}

dies-ok { max3prod( (1,2)) }, "(1,2) dies-ok";
done-testing;

my $list = (-8, 2, -9, 0, -4, 3);
say "\nInput: @list = @$list[]\nOutput: &max3prod(@$list).sort()";


exit;

