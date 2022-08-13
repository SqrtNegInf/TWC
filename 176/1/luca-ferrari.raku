#!/usr/bin/env raku

die 'not ok - does not work';

sub MAIN() {

    for 1 .. 1E3 -> $current {
        my @values = (1 .. 6).map: { $current * $_ };
        # compute the permutations of the current number
        my @permutations = $current.comb.permutations.map: *.join.Int;

        my $found = 0;
        for @values {
            $found++ if $_ == any(@permutations);
        }

        $current.say and last if $found == @values.elems;
    }
}
