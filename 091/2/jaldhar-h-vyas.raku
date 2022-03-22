#!/usr/bin/env raku

sub jump(@N) {
    my $current = 0;

    while $current < @N.elems - 1 {
        $current += @N[$current];
        if @N[$current] == 0 || $current >= @N.elems {
            return 0;
        }
    }

    return 1;
}


say jump(<1 2 1 2>);
