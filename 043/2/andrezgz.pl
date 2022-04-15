#!/usr/bin/env perl

use strict;
use warnings;

my $base = shift || 10;
die "No self-descriptive numbers in base $base" if ($base <4 || $base == 6);

if ($base >= 7) {
    my @symbols = (0..9,'A'..'Z');
    print $symbols[$base - 4] . '21' . '0' x ($base - 7) . '1000' . $/;
}
else{
    my $from = '1' . '0' x ($base-1);
    my $to = '9' x $base;

    for my $n ($from .. $to) {
        my @count = (0) x $base;
        $count[$_]++ for split //, $n;
        print $n.$/ if ($n eq join '',@count[0..$base-1]);
    }
}

__END__

./ch-2.pl 4
1210
2020

./ch-2.pl 6
No self-descriptive numbers in base 6

./ch-2.pl 10
6210001000

./ch-2.pl 16
C210000000001000
