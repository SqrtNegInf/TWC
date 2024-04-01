#!/usr/bin/env raku
use Test;

my @Test =
     (-3, 1, 2, -1, 3, -2, 4),  4,
     (-1, -2, -3, 1),           3,
     (1,2),                     2,
     (-2,2),                    1,
     (-2,),                     1,
     (2,),                      1,
     (1,0,1),                   2,
     (-1,0,0,0,1),              1,
     (1,0,0,0,1),               2,
     (0,0,0,0,0),               0,
     (),                        0,

;
plan @Test ÷ 2;

sub func( @a -->Int) {
    my %h =  @a.classify: { when $_ < 0 { Less }
                            when $_ > 0 { More } }

    for Less, More { %h{$_} = %h{$_} :exists  ?? %h{$_}.elems !! 0 }

    %h{Less} max %h{More}
}

for @Test -> @in, $exp {
    is func(@in), $exp, "$exp <- @in.sort()";
}
done-testing;

my @in = -3, 1, 2, -1, 3, -2, 4;
say "\nInput: @in = @in.raku()\nOutput: &func(@in)"

