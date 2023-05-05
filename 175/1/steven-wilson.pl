#!/usr/bin/env perl
use v5.36;

use DateTime;

my $year = 2022;
my $dt   = DateTime->new( year => $year, month => 1, day => 1 );
my %sundays;

while ( $year == $dt->year ) {
    if ( $dt->dow == 7 ) {
        $sundays{ $dt->mon } = $dt->day;
        $dt->add( days => 7 );
    }
    else {
        $dt->add( days => 1 );
    }
}

for my $month ( sort { $a <=> $b } keys %sundays ) {
    printf( "$year-%02d-$sundays{$month}\n", $month );
}
