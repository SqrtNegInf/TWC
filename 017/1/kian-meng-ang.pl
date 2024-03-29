#!/usr/bin/env perl
use v5.36;

use Carp;
use Memoize;
use Test::More;

memoize('A');
sub A($m, $n) {
    croak 'Invalid integer $m and $n' if ($m < 0 or $n < 0);
    croak 'Exceed calculation range' if ($m >= 4 && $n >= 2);

    return $n + 1                       if ($m == 0);
    return A($m - 1, 1)                 if ($m > 0 && $n == 0);
    return A($m - 1, A($m, $n - 1))     if ($m > 0 && $n > 0);
}

is A(0, 0), 1, 'A(0, 0) equal 1';
is A(1, 2), 4, 'A(1, 2) equal 4';
#is A(4, 1), 65533, 'A(4, 1) equal 65533';
done_testing;
