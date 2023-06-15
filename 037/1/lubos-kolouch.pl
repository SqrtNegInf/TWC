#!/usr/bin/env perl
use v5.36;

use DateTime;
use Data::Dumper;

my $dt = DateTime->new(
    year  => 2019,
    month => 1,
    day   => 1
);


my %month;

while ($dt->year == 2019) {
   $month{$dt->month}++ if ($dt->day_of_week < 6);

   $dt->add(days => 1);
}

for (sort keys %month)  {
    print "$_: $month{$_}\n";
}
#warn Dumper \%month;
