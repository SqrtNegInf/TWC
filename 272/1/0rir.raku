#!/usr/bin/env raku
use Test;

my @Test =

    "1.1.1.1",             "1[.]1[.]1[.]1",
    "255.101.1.0",          "255[.]101[.]1[.]0",
;
plan @Test ÷ 2;

sub task( $a is copy) {
    $a.subst: '.', '[.]', :g;
}

for @Test -> $in, $exp {
    is task($in), $exp, "$exp <- $in";
}

done-testing;


