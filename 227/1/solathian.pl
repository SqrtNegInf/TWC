#!/usr/bin/env perl
use v5.36;

use DateTime;

friday(1947);
friday(2023);
# friday(1751);
# friday(10000);

sub friday($year)
{
    die "Not in range of 1753 and 9999" unless(1752 < $year < 10000);
    my $fridays = 0;

    for(1..12)
    {
        my $dt = DateTime->new( year => $year,  month => $_,  day => 13,  );

        $fridays++      if($dt->day_name eq "Friday");
    }

    say "$year: $fridays";

}
