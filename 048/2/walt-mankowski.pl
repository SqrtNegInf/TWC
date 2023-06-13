#!/usr/bin/env perl
use v5.36;

use DateTime;

for my $year (2000..2999) {
    my $month = reverse(substr($year, 2, 2));
    if ($month >= 1 && $month <= 12) {
        my $dt = DateTime->new(year => $year, month => $month);
        for my $day (1..$dt->month_length()) {
            my $date = sprintf("%02d%02d%d", $month, $day, $year);
            say $date if $date eq reverse($date);
        }
    }
}
