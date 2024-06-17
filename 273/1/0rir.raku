#!/usr/bin/env raku
use Test;

my @Test =
   "perl",          "e",  25,
   "java",          "a",  50,
   "python",        "m",   0,
   "ada",           "a",  67,
   "ballerina",     "l",  22,
   "analitik",      "k",  13,
   'a',             "a", 100,
   'a' x 100 ~ 'b', 'a',  99,
   'a' x 100 ~ 'b', 'b',   1,
   'a' x 200 ~ 'b', 'a', 100,
   'a' x 200 ~ 'b', 'b',   0,
   'a' x 199 ~ 'b', 'a', 100,
   'a' x 199 ~ 'b', 'b',   1,
;
plan @Test ÷ 3;

sub task( $word, $letter) {
   my @w = $word.comb;
   (100 × @w.grep( $letter) ÷ @w).round;
}

for @Test -> $in, $letter, $exp {
    is task($in, $letter), $exp, "$exp <- ($letter) $in";
}

done-testing;
