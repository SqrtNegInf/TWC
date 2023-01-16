#!/usr/bin/env raku

srand 1;

use Test;

multi sub ct-good-pairs( Empty --> 0 ) {}
multi sub ct-good-pairs( @list --> Int) {
    #A pair (i, j) is called good if list[i] == list[j] and i < j.
    my $return = 0;
    for 0..@list.end -> $i {
        for $i^..@list.end -> $j {
            ++ $return if @list[$i] == @list[$j];
        }
    }
    $return;
}

multi MAIN ( ) {
    my @Test = 
        [6,6,6,6] => 6,
        [3,3,3] => 3,
        [1,1] => 1,
        [0,] => 0,
        [0,2,3] => 0,
        [1,2,1,2] => 2,
        [1,2,3,1,2,3] => 3,
        [1,2,9,1,2,9,1,2,9] => 9,
        [3,4,5,3,4,5,1,2,12,1,2,12,1,2,12] => 12,
        [12,11,10,3,4,5,3,4,5,1,2,9,1,2,9,1,2,9] => 12,
        [12,11,10,6,7,8,3,4,5,3,4,5,1,2,9,1,2,9,1,2,9] => 12,
    ;
    plan 2 * @Test +1;

    is ct-good-pairs(Empty),  0, '0 <- ' ~ (Empty).raku;
    for @Test -> $p {
        is ct-good-pairs( $p.key),  $p.value, "$p.value() <- $p.key().raku()";
        is ct-good-pairs( $p.key.pick(*)),  $p.value,
                    "$p.value() <- $p.key().pick(*).Array.raku() shuffle";
    }
    done-testing;

    my @list = [12,11,10,3,4,5,3,4,5,1,2,9,1,2,9,1,2,9];
    say "\nInput: \@list = @list.raku()\nOutput: &ct-good-pairs(@list)";
    exit;
}
