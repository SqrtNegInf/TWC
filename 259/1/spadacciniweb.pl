#!/usr/bin/env perl
use v5.36;

use DateTime;

my $start_date = '2018-06-28';
my $offset = 3;
my $bank_holidays = ['2018-07-03'];
banking_day_offset($start_date, $offset, $bank_holidays);

$start_date = '2018-06-28';
$offset = 3;
$bank_holidays = [];
banking_day_offset($start_date, $offset, $bank_holidays);

exit 0;

sub banking_day_offset {
    my $start_date = shift;
    my $offset = shift;
    my $bank_holidays = shift;

    my ($yyyy, $mm, $dd) = split /-/, $start_date;
    my $dt = DateTime->new(
        year  => $yyyy,
        month => $mm,
        day  => $dd
    );
    
    foreach (1..$offset) {
        $dt->add( days => 1 );
        while (no_banking_day($dt)) {
            $dt->add( days => 1 );
        }
    }

    printf "(start %s offset %s Bank holidays [%s]) -> %s\n",
        $start_date,
        $offset,
        (join ' / ', @$bank_holidays ),
        $dt->ymd;

    return undef;
}

sub no_banking_day {
    my $dt = shift;
    my $ymd = $dt->ymd;
    return 1
        if $dt->day_of_week >= 6
                ||
               grep /$ymd/, @$bank_holidays;
    return 0;
}
