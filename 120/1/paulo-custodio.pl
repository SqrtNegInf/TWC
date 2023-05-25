#!/usr/bin/env perl
use v5.36;

my $n = shift || 101;
say swap_bits($n);

sub swap_bits {
    my($n) = @_;
    my $out = 0;
    my $shift = 0;
    while ($n > 0) {
        if (($n & 1) != 0) { $out |= 2 << $shift; }
        if (($n & 2) != 0) { $out |= 1 << $shift; }
        $n >>= 2;
        $shift += 2;
    }
    return $out;
}
