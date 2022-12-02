#!/usr/bin/env raku

# 2022-12-02 'DESTROY' warnings ~1% of runs

sub challenge(Int $N) returns Str {
    my @output = 0 xx $N;
    my $index = $N - 1;
    while $index >= 0 {
        @output[$index] = '#';
        my $position = $index + 1; # Position is 1-based while index is 0-based
        for $position.flip.comb.kv -> $offset, $digit {
            @output[$index - ($offset + 1)] = $digit;
        }
        $index -= ($position.chars + 1);
    }
    @output.join;
}

multi sub MAIN(Int $N) {
    say challenge($N);
}

multi sub MAIN(Bool :$test) {
    use Test;

    my @tests = (
        (1, '#'),
        (2, '2#'),
        (3, '#3#'),
        (10, '#3#5#7#10#'),
        (14, '2#4#6#8#11#14#')
    );

    for @tests -> ($N, $expected) {
        is(challenge($N), $expected);
    }

    done-testing;
}
