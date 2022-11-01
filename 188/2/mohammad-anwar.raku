#!/usr/bin/env raku

use Test;

is total-zero(5, 4), 5, 'Example 1';
is total-zero(4, 6), 3, 'Example 2';
is total-zero(2, 5), 4, 'Example 3';
is total-zero(3, 1), 3, 'Example 4';
is total-zero(7, 4), 5, 'Example 5';

done-testing;

#
#
# METHOD

sub total-zero(Int $x is copy, Int $y is copy --> Int) {
    my Int $count = 0;
    while $x > 0 && $y > 0 {
        ($x >= $y)??($x = $x - $y)!!($y = $y - $x);
        $count++;
    }

    return $count;
}
