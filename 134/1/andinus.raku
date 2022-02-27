#!/usr/bin/env raku

put gather for 1023456789 .. ∞ {
    .take if .comb>>.Int.Set ≡ (0 .. 9).Set;
}[^5]
