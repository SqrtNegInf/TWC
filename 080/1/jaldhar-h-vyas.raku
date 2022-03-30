#!/usr/bin/env raku

sub MAIN(
    @N = (5, 2, -2, 0)
) {
    my @positives =  @N.grep({ $_ >= 0}).sort;
    my $smallest = @positives[0];
    for 1 .. @positives.elems -> $i {
        if (@positives[$i] // Inf) - $smallest > 1 {
            $smallest++;
            last;
        } else {
            $smallest = @positives[$i];
        }
    }
    say $smallest;
}
