#!/usr/bin/env raku

sub MAIN() {
    my @arrays = (
        <I L O V E Y O U>,
        <2 4 0 3 2 0 1 9>,
        <! ? £ $ % ^ & *>,
    );

    my $max = @arrays.sort({$^b.elems <=> $^a.elems})
                     .first
                     .elems;

    for (0 .. $max - 1) ->$i {
        say @arrays.map({$_[$i] // ' '})
                   .join(" ");
    }
}
