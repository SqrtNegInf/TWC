#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum };

sub digits_sum {
    my ($digits, $sum) = @_;
    grep $sum == sum(split //), 1 . (0 x ($digits - 1)) .. 9 x $digits
}

say for digits_sum(2, 10);
