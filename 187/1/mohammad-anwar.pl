#!/usr/bin/env perl

use v5.36;
use DateTime;
use Test2::V0 -srand => 1;

is days_together('12-01','20-01','15-01','18-01'), 4, 'Example 1';
is days_together('02-03','12-03','13-03','14-03'), 0, 'Example 2';
is days_together('02-03','12-03','11-03','15-03'), 2, 'Example 3';
is days_together('30-03','05-04','28-03','02-04'), 4, 'Example 4';

done_testing;

#
#
# METHODS

sub days_together($sd_1, $ed_1, $sd_2, $ed_2) {
    $sd_1 = _date($sd_1);
    $ed_1 = _date($ed_1);
    $sd_2 = _date($sd_2);
    $ed_2 = _date($ed_2);

    my $days = 0;

    return $days if ($ed_1 < $sd_2);

    if ($sd_2 <= $sd_1) {
        $days = _days_together($sd_1, $ed_1, $ed_2);
    }
    elsif ($sd_2 <= $ed_2) {
        $days = _days_together($sd_2, $ed_1, $ed_2);
    }

    return $days;
}

sub _date($date) {
    my ($day, $month) = split(/\-/, $date, 2);
    return DateTime->new(
        year  => 2022,
        month => $month,
        day   => $day)->truncate(to => 'day');
}

sub _days_together($from, $to, $_to) {
    my $days = 1; # inclusive day
    $to = ($to > $_to)?($_to):($to);
    while ($from < $to) {
        $from = $from->add(days => 1);
        $days++;
    }
    return $days;
}
