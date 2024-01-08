#!/usr/bin/env raku

sub MAIN(
    @ints = (0, 1, 2)
) {
    my $result = -1;

    for 0 .. @ints.end -> $i {
        if @ints[$i] % 10 == $i {
            $result = $i;
            last;
        }
    }

    say $result;
}
