#!/usr/bin/env raku

srand 1;

sub SOLUTION() {
    (1..49).pick: 6
}

#multi MAIN (Bool :$test!) {
    use Test;

    SOLUTION.&{ .note; $_ }.&{ is .elems, 6; ok .combinations(2).map({[==] $_}).none.so } for ^3;
#}


