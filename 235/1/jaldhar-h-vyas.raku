#!/usr/bin/env raku

sub MAIN( @ints  = (0, 2, 9, 4, 6)) {
    my Bool $increasing = False;

    for 0 .. @ints.end -> $i {
        my @copy = @ints;
        @copy.splice($i, 1);

        if [<] @copy {
            $increasing = True;
            last;
        }
    }

    say $increasing;
}
