#!/usr/bin/env raku

my @tests =
    (1, 2, 3, 3, 3, 3, 4, 2),
    (1, 1),
    (1, 2, 3),
    (1, 2, 5, 5, 5, 5, 4, 4, 4, 4, 2);

for @tests -> @test {
    say ((@test.Bag.grep: *.value > @test.elems / 3).sort)[0].key;
}
