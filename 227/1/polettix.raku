#!/usr/bin/env raku

sub MAIN (@years = (2023, 2026) ) { @years.map({ put $_, ' ', friday_13th($_) }) }

sub friday_13th ($year) {
   (1..12).grep({ Date.new($year, $_, 13).day-of-week == 5 }).elems
}
