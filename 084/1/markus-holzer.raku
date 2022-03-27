#!/usr/bin/env raku
unit sub MAIN( Int $i = -1700 );

say -2³¹ <= $i <= 2³¹
    ?? $i.subst( / \d+ /, + *.flip )
    !! 0;

