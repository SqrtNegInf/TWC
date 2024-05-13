#!/usr/bin/env raku

use Test;

my @Test =
    # in                                out
    (2, 5, 3, 4),                   (3,2, 5,4),
    (9, 4, 1, 3, 6, 4, 6, 1),       (1,1, 4,3, 6,4, 9,6),
    (1, 2, 2, 3),                   (2,1, 3,2),
    (),                             (),
    (0,),                           (0,),
    (0, 0),                         (0,0),
    (0, 0, 0),                      (0,0, 0),
    (9, 4, 1, 3, 6, 4, 6, 1, 0),    (1,0, 3,1, 4,4, 6,6, 9),
    (0,9, 4, 1, 3, 6, 4, 6, 1, 0),  (0,0, 1,1, 4,3, 6,4, 9,6),
;

plan @Test ÷ 2;

sub func( @a is copy ) {
    @a.=sort;
    my @ret;   # using two shift as Opt just two ptr moves but not tested
    while @a > 1 {  @ret.append: (@a.shift, @a.shift).sort.reverse }
    if @a {         @ret.append: @a.pop }
    @ret;
}

for @Test -> @in, @out {
    func( @in);
}
for @Test -> @in, @exp {
    is func(@in), @exp, "@exp[] <- @in.sort()";
}
done-testing;
