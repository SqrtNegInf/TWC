#!/usr/bin/env raku

sub move_to_end ( @a, &func ) { return @a.sort(&func) }

sub task1     (@ns) { @ns.&move_to_end( * == 0 ) }
sub task1-alt (@a)  { @a.sort(* == 0) }

my @tests =
    ( (1, 0, 3, 0, 0, 5) , (1, 3, 5, 0, 0, 0) ),
    ( (1, 6, 4)          , (1, 6, 4)          ),
    ( (0, 1, 0, 2, 0)    , (1, 2, 0, 0, 0)    ),
;
use Test;
plan 2 * +@tests;
for @tests -> ($in, $expected) {
    is-deeply task1($in), $expected;
    is-deeply task1-alt($in), $expected;
}
