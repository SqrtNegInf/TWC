#!/usr/bin/env perl
use v5.36;

my ($A, $B, $C) = ('XXY', 'XXZ', 'XXXXZY');

say is_interleave($A, $B, $C);

sub is_interleave($A, $B, $C) {
    if ($A eq '' && $B eq '' && $C eq '') {
        return 1;
    }

    if (substr($A, 0, 1) eq substr($C, 0, 1)) {
        return is_interleave(substr($A, 1), $B, substr($C, 1));
    }
    if (substr($B, 0, 1) eq substr($C, 0, 1)) {
        return is_interleave($A, substr($B, 1), substr($C, 1));
    }
    return 0;
}
