#!/usr/bin/env perl
use v5.36;

use DateTime;

say_work_days(2019);

sub say_work_days {
    my($year) = @_;
    for my $month (1..12) {
        say month_abbrev($month),": ", month_work_days($year, $month), " days";
    }
}

sub month_work_days {
    my($year, $month) = @_;
    my $work_days = 0;
    my $dt = DateTime->new(year => $year, month => $month, day => 1);
    my $month_length = $dt->month_length;
    for my $day (1 .. $month_length) {
        my $dow = $dt->day_of_week;
        $work_days++ if $dow < 6;       # mon(1) to fri(5), not sat(6), sun(7)
        $dt->add(days => 1);
    }
    return $work_days;
}

sub month_abbrev {
    my($month) = @_;
    my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
    return $months[$month-1];
}
