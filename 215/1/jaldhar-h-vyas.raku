#!/usr/bin/env raku

sub MAIN(
    @words = ('abc', 'xyz', 'tsu')
) {
    my $removals = 0;

    for @words -> $word {
        my $sorted = $word.comb.sort.join;
        if $word ne $sorted {
            $removals++;
        }
    }

    say $removals;
}
