#!/usr/bin/env raku

sub MAIN(Int $N = 12) {
    my $rightmostOneBit = $N +& -$N;
    my $nextHigherOneBit = $N + $rightmostOneBit;
    my $rightOnesSequence = $N +^ $nextHigherOneBit;

    $rightOnesSequence /= $rightmostOneBit;
    $rightOnesSequence +>= 2;

    say $nextHigherOneBit +| $rightOnesSequence;
}
