#!/usr/bin/env raku
use MONKEY-SEE-NO-EVAL;

sub MAIN(
    Str $input = '[ [1], [2,4], [6,4,9], [5,1,7,2] ]'
) {
    my @levels = EVAL $input;
    my $count = 0;
    my $i = 0;

    for @levels -> @level {
        if @level[$i] < (@level[$i + 1] // ∞) {
            $count += @level[$i];
        } else {
            $count += @level[$i + 1];
            $i = $i + 1;
        }
    }

    say $count;
}
