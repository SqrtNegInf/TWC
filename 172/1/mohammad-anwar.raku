#!/usr/bin/env raku

# 2023-02-16 GH5209

use Test;

is prime-partition(18, 2), [5, 13],    'Example 1';
is prime-partition(19, 3), [3, 5, 11], 'Example 2';

done-testing;

#
#
# METHOD

sub prime-partition(Int $m, Int $n) {
    my @primes = (2 .. $m).grep: { .is-prime };
    for @primes.combinations: $n -> $combination {
        return $combination if (sum $combination) == $m;
       #return $combination if ([+] $combination) == $m;
    }
    return;
}
