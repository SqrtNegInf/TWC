#!/usr/bin/env raku

my constant @prime = gather for 1, 2, 3, 5, 7 … ∞ { .is-prime and .&take};
my constant @primordial = lazy gather for 0 … ∞ { take [×] @prime[0..^ $_]};

.say for @primordial[0 ..^ 10];
