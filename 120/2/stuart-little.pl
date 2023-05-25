#!/usr/bin/env perl
use v5.36;

sub angl($h,$m) {
    my $rawDiff = abs(($h % 12)*30 + $m/2 - $m * 6);
    return ($rawDiff <= 180) ? ($rawDiff) : (360-$rawDiff);
}

say angl(split ":", '03:10');
