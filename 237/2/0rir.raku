#!/usr/bin/env raku

use Test;

my @Test =
    (1,),                       0,
    (1,1,1,1),                  0,
    (1,2),                      1,
    (3,2,1),                    2,
    (1,1,2),                    1,
    (1,3,2,4),                  3,
    (1,1,1,2),                  1,
    (1,1,1,1,2),                1,
    (1,1,1,1,2,2),              2,
    (1,1,1,1,2,2,2),            3,
    (1,1,1,1,2,2,2,2),          4,
    (1,1,1,1,2,2,2,2,2),        4,
    (1,1,1,1,2,2,2,2,2,2,2),    4,
    (1,3,5,2,1,3,1),            4,
    (1,1,3,5,2,1,3,1),          4,
    (1,3,5,2,1,3,1,3,3,5),      6,
    (1,3,5,2,1,3,1,3,3,3),      5,
    (1,3,5,2,1,3,1,5,5,5),      6,
    (1,3,5,2,1,3,1,5,5,5,4),    7,
;

plan @Test ÷ 2;

sub func( @in is copy --> Int) {

    return 0 if @in.end == 0;

    my ($head, $tail, $work) = 0, 1, 0;
    @in.=sort;

    while $tail ≤ @in.end {
        if @in[$tail] == @in[$head] {
            ++$tail;
            next;
        }
        ++$tail;
        ++$head;
    }
    $head;
}

for @Test -> @in, $exp {
    is func(@in), $exp, "$exp <- in: @in.sort()";
}
done-testing;
my @int = (1,3,5,2,1,3,1,5,5,5,4).sort;
say "\nInput: @int =  @int.raku()\nOutput: &func( @int)";
