#!/usr/bin/env raku

use Test;

my @Test =
    #yr   mo  occur  dow         day
    2024,  4,   1,     1,          1,
    2024,  4,   1,     2,          2,
    2024,  4,   1,     3,          3,
    2024,  4,   1,     4,          4,
    2024,  4,   1,     5,          5,
    2024,  4,   1,     6,          6,
    2024,  4,   1,     7,          7,

    2024,  4,   2,     2,          9,
    2024,  4,   3,     2,         16,
    2024,  4,   4,     2,         23,
    2024,  4,   5,     2,         30,
    2024,  4,   6,     2,         Int,

    2025, 10,   2,     4,          9,
    2026,  8,   5,     3,         Int,
    2024,  3,   3,     1,         18,
;

plan 33 + @Test ÷ 5;

# Argument $date must only be in the correct month and year.

sub nth-day-or-zed( Date $date, UInt $dow, UInt $nth --> Int ) {
    $_ = nth-day-of-week-in-month( $date, $dow, $nth );
    .defined ?? .day !! Int
}

sub nth-day-of-week-in-month( Date $date,
                              UInt $dow,
                              UInt $nth is copy --> Date ) {
    my $ret = first-day-of-week-in-month( $date, $dow) + ($nth × 7) -7;
    return Date if $date.month ≠ $ret.month;
    $ret;
}

sub first-day-of-week-in-month( Date $date is copy,
                              UInt $dow where 0 < * < 8 --> Date ) {
    my $start-day-of-week = ( $date.=first-date-in-month ).day-of-week;
    return  do given $start-day-of-week <=> $dow {
                when Less { $date += $dow - $start-day-of-week;        }
                when More { $date += 7    - $start-day-of-week + $dow; }
                when Same { $date; }
            }
}

for @Test -> $y,$m, $nth, $dow, $exp  {
    if $nth == 1 {
        is first-day-of-week-in-month( Date.new( $y,$m,14), $dow).day-of-week,
                $exp,
                "first-day-o-wk-in-mo";
    }
    my $x = Date.new(  $y, $m, 15); 

    my $res = nth-day-of-week-in-month( $x, $dow, $nth);
    if $res.defined {
        is $res.day, $exp, "day is expected";
        is $res.weekday-of-month == $nth, True, "weekday match";
    }

    is nth-day-or-zed( $x, $dow, $nth),
            $exp, "yr/mo: $y/$m  occur: $nth  dow: $dow ";
}
done-testing;

my ($Year, $Month, $Weekday-of-month, $day-of-week) = 2024, 4, 3, 2;
say   "\nInput: Year = $Year, Month = $Month,"
    ~ " Weekday of month = $Weekday-of-month, day-of-week = $day-of-week"
    ~ "\nOutput: ",
    nth-day-or-zed(
        Date.new( $Year, $Month, 7), $day-of-week, $Weekday-of-month);
exit;

