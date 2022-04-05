#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my ($m, $n) = (11,3);

say divide($m, $n);

sub divide($m, $n) {
    # handle 0 values first
    return "undefined" if $n == 0;
    return 0 if $m == 0;

    # sign of the result
    my $sign = ($m < 0 && $n > 0) || ($m > 0 && $n < 0) ? -1 : 1;
    ($m, $n) = map {abs} ($m, $n);
    my $cnt = 0;
    while ($m >= $n) {
        $m -= $n;
        $cnt++;
    }

    if ($sign == -1 && $m > 0) {
        # floor is 1 below cnt when negative and there's a remainder
        return -($cnt+1);
    } else {
        return $cnt * $sign;
    }
}
