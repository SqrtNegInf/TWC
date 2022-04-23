#!/usr/bin/env raku

sub MAIN()
{
    for (2019..2100) -> $year  {
        (Date.new(day =>25, month=>12, year=>$year).day-of-week == 7)
            and  say "25 Dec $year";
    }
}
