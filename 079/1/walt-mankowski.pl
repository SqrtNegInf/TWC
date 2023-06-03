#!/usr/bin/env perl
use v5.36;

sub bits_set($x) {
    my $bin = sprintf "%b", $x;
    return $bin =~ tr/1//;
}

my $MOD = 1000000007;
my $n = 4;
my $sum = 0;
$sum += bits_set($_) for 1..$n;

say $sum, " ", $sum % $MOD;
