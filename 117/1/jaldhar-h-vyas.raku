#!/usr/bin/env raku

sub MAIN(
    Str $filename = 'example.txt'
) {
    my @lines = $filename.IO.lines.map({
        / ^ (\d+) /;
        $/[0].Int;
    }).sort;

    my $counter = 1;
    for @lines -> $line {
        if $line != $counter {
            say $counter;
            last;
        }
        $counter++;
    }
}
