#!/usr/bin/env perl
use v5.36;

sub invert_bit {
    my ($m, $n) = @_;
    my $bit = 2 ** ($n - 1);
    return $m + $bit - 2 * ($m & $bit)
}

use Test::More;

is invert_bit(12, 3),  8, 'Example 1';
is invert_bit(18, 4), 26, 'Example 2';
done_testing();
