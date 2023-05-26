#!/usr/bin/env perl
use v5.36;
# no warnings 'portable';

use constant MAX => 2 ** 32;

sub higher_integer_set_bits_naive {
    my ($n) = @_;
    my $bits = unpack '%b*', pack 'l', $n;
    1 until $bits == unpack '%b*', pack 'l', ++$n;
    return $n
}

sub higher_integer_set_bits {
    my ($n) = @_;

    my $binary = sprintf '%b', $n;
    if (-1 != (my $pos = rindex $binary, '01')) {
        substr $binary, $pos, 2, '10';
        my $suffix = substr $binary, $pos + 2, length $binary, "";
        my $ones = $suffix =~ tr/1//d;
        $suffix .= 1 x $ones;
        return oct "0b$binary$suffix";
    }

    my $pos = rindex $binary, '1';
    my $zeros = substr $binary, $pos + 1, length $binary, "";
    substr $binary, 1, 0, "0$zeros";
    return oct "0b$binary"
}

use Test::More;

is higher_integer_set_bits(3), 5, 'Example 1';
is higher_integer_set_bits(12), 17, 'Example 2';

is higher_integer_set_bits(2 ** 14 + 2 ** 15), 2 ** 16 + 1, '2^14 + 2^15';

done_testing();
