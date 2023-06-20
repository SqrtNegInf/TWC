#!/usr/bin/env perl
use v5.36;

use Memoize;
memoize('ackermann');

sub ackermann {
    my ($m, $n) = @_;

    return $n + 1 if 0 == $m;

    no warnings 'recursion';
    return ackermann($m - 1, 1) if 0 == $n;

    return ackermann($m - 1, ackermann($m, $n - 1))
}

say ackermann(0,0);
say ackermann(1,0);
say ackermann(1,1);
say ackermann(1,2);

