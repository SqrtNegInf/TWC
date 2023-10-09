#!/usr/bin/env raku

sub MAIN(
    @nums = (3,2,1);
) {
    my $maxGreatness = 0;

    for @nums.permutations -> $perm {
        my $greatness =  (@nums Z @$perm).grep({ @$_[0] < @$_[1 ]}).elems;
        if $greatness > $maxGreatness {
            $maxGreatness = $greatness;
        }
    }

    say $maxGreatness;
}
