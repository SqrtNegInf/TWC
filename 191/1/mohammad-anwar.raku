#!/usr/bin/env raku

use Test;

is twice-largest(<1 2 3 4>), -1, 'Example 1';
is twice-largest(<1 2 0 5>),  1, 'Example 2';
is twice-largest(<2 6 3 1>),  1, 'Example 3';
is twice-largest(<4 5 2 3>), -1, 'Example 4';

done-testing;

#
#
# METHOD

sub twice-largest(@list --> Int) {
    my Int $max = @list.sort.tail;
    for @list -> $i {
        next if $i == $max;
        ($i * 2 > $max) and return -1;
    }

    return 1;
}
