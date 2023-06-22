#!/usr/bin/env perl
use v5.36;

use DateTime;
use DateTime::Duration;
 
my $year = 2019;

my $dt = DateTime->new(
    month => 1,
    day   => 1,
    year  => $year
);
my $add_week = DateTime::Duration->new( weeks => 1 );
my $add_day  = DateTime::Duration->new( days  => 1 );

while ( $dt->day_of_week() != 5 ) { $dt->add($add_day); }

my %last_fri;
while ( $dt->year == $year ) {
    $last_fri{ $dt->month } = $dt->ymd("/");
    $dt->add($add_week);
}

{
    local $, = "\n";
    say @last_fri{ sort { $a <=> $b } keys %last_fri };
}
