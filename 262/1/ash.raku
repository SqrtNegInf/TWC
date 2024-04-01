#!/usr/bin/env raku

my @tests =
    (-3, 1, 2, -1, 3, -2, 4),
    (-1, -2, -3, 1),
    (1, 2);

for @tests -> @test {
    say max((@test.grep: * > 0).elems, (@test.grep: * < 0).elems);
}
