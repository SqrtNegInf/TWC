#!/usr/bin/env raku

# for test #3, result differs from others

for <1 2 3>, <2 3 4>, <1 2 3 10> -> @n {
    say @n, " -> ", ([~&] $_ for @n.combinations(2)).sum;
}
