#!/usr/bin/env perl
use v5.36;

sub ackermann {
    my ($m, $n) = @_;

    if ($m < 0 || $n < 0) {
        return undef;
    }

    if ($m == 0) {
        return $n + 1;
    }

    if ($n == 0) {
        return ackermann($m - 1, 1);
    }

    return ackermann($m - 1, ackermann($m, $n - 1));
}

say ackermann(0,0);
say ackermann(1,0);
say ackermann(1,1);
say ackermann(1,2);
