#!/usr/bin/env raku

use Test;

my @a = (1, 2, 3);
my @b = ('a', 'b', 'c');

is [ zip(@a, @b) ], [1, 'a', 2, 'b', 3, 'c' ], 'Example 1';
is [ zip(@b, @a) ], ['a', 1, 'b', 2, 'c', 3 ], 'Example 2';

done-testing;

sub zip(@a, @b) {
    my @zip = (@a Z @b);
    return @zip;
}
