#!/usr/bin/env perl
use v5.36;

#
# We can solve this by just shifting some bits around.
# There is also no need to restrict ourselves to numbers less than 256.
#


while (<DATA>) {
    say + ($_ & ~0xFF)       # Number with the last two nibbles 0.
        | ($_ &  0x0F) << 4  # Last nibble shifted 4 bits to the left.
        | ($_ &  0xF0) >> 4  # Penultimate nibble shifted 4 bits to the right.
}

__END__
101
18
