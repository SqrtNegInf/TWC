#!/usr/bin/env raku

my @tests =
    ((1, 5, 3, 2, 4, 2), 2),
    ((1, 2, 4, 3, 5),    6),
    ((5, 3, 2, 4, 2, 1), 4);

for @tests -> @test {
    say solve(@test[0], @test[1]);
}

sub solve(@data, $value) {
    my @sorted = @data.sort;
    return @sorted.grep($value, :k);
}
