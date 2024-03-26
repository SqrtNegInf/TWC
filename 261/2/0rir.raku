#!/usr/bin/env raku

use Test;

my @Test =
    # list       find  exp
     (),            3, Int,
     (1,),          0, 0,
     (1,),          3, 3,
     (5,3,6,1,12),  3, 24,
     (5,6,7),       2, 2,
     (1,2,4,3),     1, 8,
;
plan  @Test ÷ 3;

multi func( List $list where * ~~ Empty, Any:D $n ) { Int }
multi func( List $list, $n where * == 0) { 0 }
multi func( List $list, Any:D $n is copy) {
    return $n if not $n == $list.any;
    while so $n == $list.any {
        $n ×= 2;
    }
    return $n;
}

for @Test -> $list, $n, $exp {
    is func($list, $n), $exp, ($exp // $exp.^name) ~ " <- $n <- $list";
}

done-testing;
my $ints = (2,4,24,48,3,5,6,7,5,3,95,6,12,96);
my $start = 3;
say "\nInput: \$ints = $ints.raku() and \$start = $start
Output: &func($ints, $start)";


