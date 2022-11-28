#!/usr/bin/env raku

use Test;

is binary-flip(5), 2, 'Example 1';
is binary-flip(4), 3, 'Example 2';
is binary-flip(6), 1, 'Example 3';
is binary-flip(2⁶⁴ +1), 2⁶⁴ -2, 'Example 4';

done-testing;

#
#
# METHOD

sub binary-flip(Int $n is copy --> Int) {
    return $n.base(2)
             .comb()
             .map(-> $v { ($v == 0)??(1)!!(0) })
             .join(q{})
             .parse-base(2);
}
