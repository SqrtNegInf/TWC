#!/usr/bin/env raku

sub invert_bit2 { $^m +^ (1 +< ($^n - 1)) }

sub invert_bit1 ( UInt:D $m, UInt:D $bit_to_invert ) {
    my $mask = 1 +< ($bit_to_invert - 1);
    return $m +^ $mask;
}
say invert_bit1(12, 3);
say invert_bit1(18, 4);

say invert_bit2(12, 3);
say invert_bit2(18, 4);
