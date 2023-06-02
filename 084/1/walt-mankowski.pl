#!/usr/bin/env perl
use v5.36;

my $n = -1700;
if ($n >= 0) {
    my $result = scalar reverse $n;
    say $result > 2**31 - 1 ? 0 : $result;
} else {
    my $result = "-" . scalar reverse abs $n;
    say $result < -(2**31) ? 0 : $result;
}
