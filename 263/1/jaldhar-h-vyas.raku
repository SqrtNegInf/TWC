#!/usr/bin/env raku

sub MAIN(
    $k = 2,
    @ints = (1, 5, 3, 2, 4, 2)
) {
    my @sorted = @ints.sort;
    say q{(}, @sorted.keys.grep({ @sorted[$_] == $k}).join(q{, }), q{)};
}
