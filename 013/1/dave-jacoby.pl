#!/usr/bin/env perl
use v5.36;

use DateTime;

my $year = 2019;

last_fridays($year);

# best to not think of this in terms of the year, but as 12 
# instances of last friday in the month
sub last_fridays ( $year ) {
    for my $mon ( 1 .. 12 ) { say last_friday( $year, $mon ); }
}

sub last_friday ( $year, $mon ) {
    # Thank you Dave Rolsky and everyone else who made this simple

    # Months are not of a standard size. We don't know the last day
    # but we do know what the first day is
    my $dt = DateTime->new(
        year      => $year,
        month     => $mon,
        day       => 1,
        hour      => 12,
        minute    => 0,
        second    => 0,
        time_zone => 'floating'
    );

    # and no month is 32 days long
    $dt->add( days => 32 );

    # while does nothing if the test is true
    $dt->subtract( days => 1 ) while $dt->day_of_week != 5; # find a friday
    $dt->subtract( days => 7 ) while $dt->month != $mon;    # and move backto the right month
    return $dt->ymd('/'); # example solution uses slashes
}

__DATA__

2019/01/25
2019/02/22
2019/03/29
2019/04/26
2019/05/31
2019/06/28
2019/07/26
2019/08/30
2019/09/27
2019/10/25
2019/11/29
2019/12/27
