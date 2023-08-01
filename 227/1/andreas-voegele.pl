#!/usr/bin/env perl
use v5.36;

no warnings 'uninitialized';

use POSIX qw(mktime);

sub friday_13th ($year) {
    my $_year  = $year - 1900;
    my $mkdate = sub ($month) { mktime(0, 0, 0, 13, $month, $_year) };
    return grep { (localtime $_)[6] == 5 } map { $mkdate->($_) } 0 .. 11;
}

say scalar friday_13th(1753);
say scalar friday_13th(2023);
say scalar friday_13th(9999);
