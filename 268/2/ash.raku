#!/usr/bin/env raku

my @tests =
    (2, 5, 3, 4),
    (9, 4, 1, 3, 6, 4, 6, 1),
    (1, 2, 2, 3);

for @tests -> @test {
    my @out;
    for @test.sort -> $a, $b {
        if $a > $b {
            @out.push($a, $b);
        }
        else {
            @out.push($b, $a);
        }
    }

    say @out;
}
