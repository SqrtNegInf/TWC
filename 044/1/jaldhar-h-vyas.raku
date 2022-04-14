#!/usr/bin/env raku
use MONKEY-SEE-NO-EVAL;

my @digits = 1 .. 9;
my @ops = (' + ', ' - ', q{});

say "$_ = 100" and exit for
    (([X] @ops xx 8) X q{})
    ==> map({ (@digits Z~ @_).join; })
    ==> grep({ EVAL($_) == 100; });
