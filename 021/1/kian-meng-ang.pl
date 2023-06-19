#!/usr/bin/env perl
use v5.36;

sub euler_number ($n) {
    return (1 + 1 / $n) ** $n;
}

say euler_number(1_000_000);

1;
