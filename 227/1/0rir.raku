#!/usr/bin/env raku

use Test;

sub fri13ths-in-year( $year -->Int) {
    my $ret;
    for 1..12 -> $mo {
       ++ $ret if Date.new( $year, $mo, 13).day-of-week == 5;
    }
    $ret;
}

my $year = 2026;
say "Input: \$year = $year\n Output: ", fri13ths-in-year( $year);

