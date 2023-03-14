#!/usr/bin/env raku

use v6.e.PREVIEW;
use Test;

my @Test =
    [ (), 0],
    [ (0,), 0],
    [ (0,0,0), 0],
    [ (1,), 1],
    [ (∞,), 1],
    [ (∞,∞), 2],
    [ (1,∞,1,∞,∞), 3],
    [ (1,∞,∞,1), 2],
    [ (1,∞,1,1), 1],
    [ (10,), 1],
    [ (0,0,1), 1],
    [ (10,8,5,4,3), 4 ],
    [ (25,8,5,3,3), 3 ],
;
plan +@Test;

sub h-index( $l = (10,8,5,4,3) --> Int ) {
    my $r = $l.sort({$^b <=> $^a})
              .pairs
              .List
              .first( {.key ≤ .value -1}, :end)
              .key;
    // $r ?? $r + 1 !! 0;
}

for @Test -> ($t, $exp) {
    is h-index($t), $exp, "$exp <- $t.Str()";
}
done-testing;

my @citations = (0,0,1,0,3,2,7,∞,∞,∞);
say "\nInput: @citations = @citations[]\nOutput: ", h-index(@citations);
