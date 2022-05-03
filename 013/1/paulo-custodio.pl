#!/usr/bin/env perl

use Modern::Perl;
use constant Friday => 5;

sub is_leap {
    my($year) = @_;
    return ((($year % 4)==0 && ($year % 100)!=0) || ($year % 400)==0) ? 1 : 0;
}

sub days_in_month {
    my($year, $month) = @_;
    my @dom = (31, 28+is_leap($year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    return $dom[$month-1];
}

sub day_of_year {
    my($year, $month, $day) = @_;
    my $dayno = $day;
    $dayno += days_in_month($year, $_) for (1 .. $month-1);
    return $dayno;
}

# return 1..7 <=> Monday..Sunday
sub day_of_week {
    my($year, $month, $day) = @_;
    my $dayno = day_of_year($year, $month, $day);
    my $wdnog = ($dayno + $year + int(($year-1)/4) - int(($year-1)/100)
                 + int(($year-1)/400) - 2) % 7 + 1;
    return $wdnog;
}

sub last_friday {
    my($year, $month) = @_;
    for my $day (reverse 1 .. days_in_month($year, $month)) {
        if (day_of_week($year, $month, $day) == Friday) {
            return ($year, $month, $day);
        }
    }
}

my $year = shift || 2019;
for my $month (1..12) {
    my($y,$m,$d) = last_friday($year,$month);
    printf("%04d/%02d/%02d\n", $y,$m,$d);
}
