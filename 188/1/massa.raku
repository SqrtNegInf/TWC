#!/usr/bin/env raku

use Test;

is 2, divisible-pairs 2, (4, 5, 1, 6);
is 2, divisible-pairs 2, (1, 2, 3, 4);
is 2, divisible-pairs 3, (1, 3, 4, 5);
is 2, divisible-pairs 4, (5, 1, 2, 3);
is 1, divisible-pairs 4, (7, 2, 4, 5);
is 6, divisible-pairs 2, (2, 2, 2, 2);

done-testing;

sub divisible-pairs($k, @list) {
    + @list.combinations(2)».sum.grep: * %% $k
}

