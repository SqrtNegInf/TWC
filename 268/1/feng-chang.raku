#!/usr/bin/env raku

#unit sub MAIN(Str:D $x, Str:D $y);

my @x = <3 7 5>; my @y = <9 5 7>;

put (@y.sum - @x.sum) / +@x;
