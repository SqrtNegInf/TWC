#!/usr/bin/env raku

sub MAIN () {
    my @leonardo = 1, 1, * + * + 1 ... *;
    say "L($_) = " ~ @leonardo[$_]
        for (1 .. 20);
}
