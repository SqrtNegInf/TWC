#!/usr/bin/env raku 

use MONKEY-SEE-NO-EVAL;

sub MAIN($expression = '3*2+2') {
    say EVAL $expression;
}
