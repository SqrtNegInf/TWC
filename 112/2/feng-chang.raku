#!/usr/bin/env raku

sub MAIN(UInt:D $n = 10) {
    put (1, 1, *+* ... *)[$n];      # It's Fibonacci!
}
