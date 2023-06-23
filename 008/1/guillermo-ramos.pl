#!/usr/bin/env perl
use v5.36;

my @primes;

sub perfect {
    my $sum = 0;
    my $n = shift;
    my $candidate = 1;
    while ($candidate*2 <= $n) {
        $sum += $candidate if $n % $candidate == 0;
        $candidate++;
    }

    return $n == $sum;
}

my $n = 1;
my $perfects = 0;
while ($perfects < 4) {
    if (perfect($n)) {
        print $n, "\n";
        $perfects++;
    }
    $n++;
}
