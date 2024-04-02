#!/usr/bin/env raku

use Test;

my @Test =
    # $exp   @in                $k
    4,      (3,1,2,2,2,1,3),    2,
    0,      (1,2,3),            1,
    0,      (),                 1,
    0,      (1,),               0,
    3,      (0,0,0,),           1,
;
plan @Test ÷ 3;

multi func( Int $k, @in where *.end == -1 ) { 0 }
multi func( Int:D $k, @in) {
    # a) 0 <= i < j < size of @ints
    #b) ints[i] == ints[j]
    #c) i x j is divisible by k
    (^@in).combinations(2).grep( {
        ( .[0] < .[1] )
        and ( .[0] × .[1] %% $k )
        and ( @in[ $_[0]] == @in[ $_[1]] )
    }).Int;
}

for @Test -> $exp, @in, $k {
    is func($k, @in), $exp, "$exp <- $k «- @in.raku()";
}

done-testing;
my @in = ( 1,1,1,1,1,3,3,3);
my $j = 3;
say "Input: @ints = @in[] and \$k = $j\n Output: &func($j, @in)"


