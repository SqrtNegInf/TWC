#!/usr/bin/env raku

use Test;

is mac-address('1ac2.34f0.b1c2'), '1a:c2:34:f0:b1:c2', 'Example 1';
is mac-address('abc1.20f1.345a'), 'ab:c1:20:f1:34:5a', 'Example 2';

done-testing;

sub mac-address($_) {
    S:g/\.//.comb(2).join: ':'
}
