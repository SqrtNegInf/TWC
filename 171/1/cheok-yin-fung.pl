#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/divisor_sum/;

my $N = $ARGV[0] || 20;
my @abunt;
my $n = 9;

while (scalar @abunt < $N) {
    $n += 2;
    if (divisor_sum($n) > 2*$n) {
        say $n;
        push @abunt, $n;
    }
}
