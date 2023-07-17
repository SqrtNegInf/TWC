#!/usr/bin/env raku

sub task1 (@sentences --> UInt) {
    return @sentences.map( *.words.elems ).max;
}

# Shorter:
my &task2 = *».words».elems.max;


my @tests =
    ( 8, ( 'Perl and Raku belong to the same family.', 'I love Perl.', 'The Perl and Raku Conference.', ) ),
    ( 7, ( 'The Weekly Challenge.', 'Python is the most popular guest language.', 'Team PWC has over 300 members.' ) ),
;
use Test;
plan 2 * +@tests;
for @tests -> ( $expected, @sentences ) {
    is task1(@sentences), $expected;
    is task2(@sentences), $expected;
}
