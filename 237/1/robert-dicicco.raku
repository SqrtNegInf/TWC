#!/usr/bin/env raku

my $cnt = 0;
my $fnd = 0;

sub foo ( $year, $mnth, $wom, $dow) {
    my $month = sprintf("%02d",$mnth);
    my $weekday_of_month = sprintf("%02d", $wom);
    my $day_of_week = sprintf("%02d",$dow);
    my $days_in_month = Date.new("$year-$month-01").days-in-month;
    say "Input: Year = $year, Month = $month, Weekday of month = $weekday_of_month, day of week = $day_of_week";

    loop (my $d = 1; $d <= $days_in_month; $d++) {
        $d = sprintf("%02d",$d);
        my $s = "$year-$month-$d";
        my $day_of_week = Date.new("$year-$month-$d").day-of-week;
        if $dow == $day_of_week {
            $cnt++;
            if $cnt == $weekday_of_month {
                say "Output: ",substr($s,8,2);
                $fnd++;
                last;
            }
        }
    }
    if ($fnd == 0) {
        say "Output: 0";
    }
}

foo(2024,4,3,2);
