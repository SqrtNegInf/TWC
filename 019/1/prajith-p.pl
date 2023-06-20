#!/usr/bin/env perl
use v5.36;

use DateTime;

for my $year (1900..2019) {
    for my $month ( 1 , 3 , 5 , 7 , 8 , 10 , 12 )  {
        my $dt = DateTime->new( year => $year , month => $month, day => 1);
        if ( $dt->day_of_week == 5 ) {
            say $dt->year . ' - ' . $dt->month_name;
        }
    }
}
