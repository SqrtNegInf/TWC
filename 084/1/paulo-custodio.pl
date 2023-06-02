#!/usr/bin/env perl
use v5.36;

my($n) = -1700;
say reverse_int($n);

sub reverse_int {
    my($n) = @_;
    return 0 if ($n < -0x80000000 || $n > 0x7fffffff);
    my $rev = 0;
    my $sign = ($n < 0) ? -1 : 1;
    $n = abs($n);
    while ($n > 0) {
        $rev = 10 * $rev + ($n % 10);
        $n = int($n / 10);
    }
    $rev *= $sign;
    return $rev;
}
