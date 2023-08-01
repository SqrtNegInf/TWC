#!/usr/bin/env raku

sub MAIN(
    Int() $year where 1753 <= * <= 9999 = 2023
) {
    (1..12)
    .map( -> $m { Date.new($year,$m,13) } )
    .grep( -> $d { $d.day-of-week == 5 } )
    .elems
    .say;
}
