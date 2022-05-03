#!/usr/bin/env raku

sub MAIN ( Int $year = 2022 )
{
    .say for grep { .day-of-week == 5 && (.days-in-month - .day < 7 ) },
                  (Date.new($year, 1, 1) ... Date.new($year, 12, 31) );
}
