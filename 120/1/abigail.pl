#!/usr/bin/env perl
use v5.36;

#
# This is just week 119 with different constants
#


while (<DATA>) {
    say + ($_ & 0x55) << 1  # Odd  bits shifted one the right 
        | ($_ & 0xAA) >> 1  # Even bits shifted one to the left
}

__END__
101
18
