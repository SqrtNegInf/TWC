#!/usr/bin/env perl
use v5.36;

sub invert_bit {
    die if @_ != 2;
    my ( $m, $n ) = @_;
    return $m ^ ( 1 << ($n - 1) );
}
say invert_bit(12, 3);
say invert_bit(18, 4);
