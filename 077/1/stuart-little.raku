#!/usr/bin/env raku

sub fibsum($n) {
    (1,2,* + * ... * >= $n)
    .combinations
    .grep(*.sum == $n)
}

for (fibsum(377.Int)) { .say }
