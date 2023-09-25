#!/usr/bin/env raku

sub MAIN( @ints (1, 0, 2, 3, 0, 4, 5, 0)) {
    my @output;

    for @ints -> $elem {
        if $elem == 0 {
            @output.push(| (0, 0));
        } else {
            @output.push($elem);
        }

        if @output.elems == @ints.elems {
            last;
        }
    }

    say q{(}, @output.join(q{, }, ), q{)};
}
