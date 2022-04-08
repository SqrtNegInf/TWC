#!/usr/bin/env raku
use v6;

sub concat_nrs(@a, $l) {
    (@a xx $l).reduce(&infix:<X~>)
    .grep({ $l==0 || $_.substr(0..0) ne '0' })
    .grep(*.chars == $l)
}

say (0, 1, 2, 5).&concat_nrs(2).grep(*.Int < 21)
