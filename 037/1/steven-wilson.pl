#!/usr/bin/env perl
use v5.36;

use DateTime;

my @months = qw/ Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec /;
my $year = "2019";
my %weekdays_in_month;
my $dt = DateTime->new( year => $year );

while ( $dt->year eq $year ) {
    if ( $dt->dow() < 6 ) {
        $weekdays_in_month{ $dt->month_abbr() }++;
    }
    $dt->add( days => 1 );
}

for my $month (@months) {
    say "$month: $weekdays_in_month{$month}";
}
