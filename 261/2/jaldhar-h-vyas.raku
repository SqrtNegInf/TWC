#!/usr/bin/env raku

sub MAIN(
    $start  = 3,
    @ints = (5, 3, 6, 1, 12)
) {
    my $end = $start;
    for 0 .. @ints.end -> $i {
        if ($end == @ints[$i]) {
            $end *= 2;
        }
    }

    say $end;
}
