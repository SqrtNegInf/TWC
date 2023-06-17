#!/usr/bin/env perl
use v5.36;

use DateTime;

my $start_year = 2019;
my $end_year   = 2100;
my $sunday     = 7;
my $dt         = DateTime->new(
    year  => $start_year,
    month => 12,
    day   => 25
);
my @sunday_christmas;

while ( $dt->year() <= $end_year ) {
    if ( $dt->dow() == $sunday ) {
        push @sunday_christmas, $dt->clone();
    }
    $dt->add( years => 1 );
}

say "List of Sunday Christmases between $start_year and $end_year:";
say join "\n", @sunday_christmas;
