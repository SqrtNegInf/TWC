#!/usr/bin/env raku

sub MAIN(
    Int $N = 1, # numerator
    Int $D where {$D != 0 } = 24 #denominator (not 0)
) {
    my ($non-rep, $repeating) = ($N / $D).base-repeating;
    if $repeating ne q{} {
        $repeating = "($repeating)";
    }
    say "$non-rep$repeating";
}
