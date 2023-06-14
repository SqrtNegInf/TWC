#!/usr/bin/env perl
use v5.36;

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
