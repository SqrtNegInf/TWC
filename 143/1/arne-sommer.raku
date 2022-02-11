#!/usr/bin/env raku

#unit sub MAIN ($expression where $expression ~~ /^<[0..9 \( \) \+ \- \* \s]>+$/);

my $expression = '3*2+2';
say $expression.EVAL;
