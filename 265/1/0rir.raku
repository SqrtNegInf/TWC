#!/usr/bin/env raku

use Test;

my @Test =
    3,      (1,2,3,3,3,3,4,2),
    1,      (1,1),
    1,      (1,2,3),
    Int,    (1,2,3,4),
    1,      (4,1,4,1,4,1,4,1),
    1,      (4,1,4,1,4,1,4,4),
    1,      (4,1,4,1,4,1,4,9),
#   1,      flat( (1,2,3) xx 333_331, 4 xx 7 ),
#   1,      flat( (1,2,3) xx 33_330, 2, 2, 4 xx 7),
#   Int,    flat( (1,2,3) xx 30, 4 xx 10 ),
#   Int,    flat( (1,2,3) xx 30, 4 xx 9 ),
#   3,      flat( (1,2,3) xx 30, 3 xx 10 ),
;
plan @Test ÷ 2;

sub over( @a, $min = 33 -->Int) {
    my $m = MixHash.new( @a);
    for $m.values -> $v is rw { $v ×= 100 ÷ @a.elems }      # percents
    my $ret = $m.sort( { .value, .key } ).first( *.value > $min);
    $ret.defined ?? $ret.key !! Int;
}

for @Test -> $exp, @in {
    is over( @in), $exp, ($exp // 'Int') ~ " <- @in.gist()";
}

done-testing;
my @int =  flat | (1,2,3) xx 32, 4, 2, 3,3 ;
say "\nInput: @int = @int[]\nOutput: ", over(@int);
