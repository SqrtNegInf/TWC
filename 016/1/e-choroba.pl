#!/usr/bin/env perl
use v5.36;

use bignum;

my $pie = 1;
my $max = 0;

my @guest;
for (1 .. 100) {
    my $part = $pie / 100 * $_;
    $pie -= $part;
    push @guest, $part;
    $max = $_ if $part > $guest[$max];
}

say $max, ' ', $guest[$max];
