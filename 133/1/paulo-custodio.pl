#!/usr/bin/env perl
use v5.36;

my $n = shift || 10;
say isqrt($n);

sub isqrt {
    my($n) = @_;
    my $x0 = $n >> 1;       # initial estimate
    return $n if $x0 == 0;

    # loop
    my $x1 = ($x0 + $n/$x0) >> 1;
    while ($x1 < $x0) {
        $x0 = $x1;
        $x1 = ($x0 + $n/$x0) >> 1;
    }
    return $x0;
}
