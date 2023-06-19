#!/usr/bin/env perl
use v5.36;

use List::Util qw<any>;

my $MAX_SEXY = 10;

my @primes = ();
my @sexy;
my $p = 2;

while (@sexy < $MAX_SEXY*2) {
    unless (any { $p % $_ == 0 } @primes) {
        push @primes, $p;
        push @sexy, $primes[-2], $primes[-1]
            if @primes > 1 && $primes[-1] == $primes[-2] + 6;
    }
    $p++;
}

foreach my $i (0 .. @sexy/2-1) {
    printf "%s-%s\n", $sexy[$i*2], $sexy[$i*2+1];
}
