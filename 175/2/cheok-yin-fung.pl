#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/euler_phi/;

my $p = 0;
for (my $n0 = 3; $n0 < 1_000_000_000; $n0 += 2) {
    my $n = $n0;
    my $sum = 0;
    do {
        $n = euler_phi($n);
        $sum += $n;
    } until ($sum > $n0 || $n == 1);
    if ($sum == $n0) {
        say $n0;
        $p++;
    }
    last if $p >= ($ARGV[0] || 20);
}
