#!/usr/bin/env raku

constant %MONTHS := Map.new( (1..12) Z <Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec> );

sub MAIN(
    Int() $year = 2019
) {
    for (1..12) -> $month {
        my $end = Date.new( :1day, :$month, :$year ).days-in-month();
        my $total = [+] (0..6).map( { Date.new( :day($end-$_), :$month, :$year ) } ).grep( { $_.day-of-week !~~ 6|7 } ).map( { $_.weekday-of-month } );
        say "{%MONTHS{$month}} : {$total} days";
    }
}
