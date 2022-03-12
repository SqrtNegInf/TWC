#!/usr/bin/env raku

    my @N = (1, 3, 8, 2, 0);
    if @N.elems == 1 {
        say 0;
    } else {
        @N = @N.sort;
        my $previous = @N[0];
        my $largest = -∞;
        for 1 ..^ @N.elems -> $i {
            my $gap =  @N[$i] - $previous;
            if $gap > $largest {
                $largest = $gap;
            }
            $previous = @N[$i];
        }
        say $largest;
    }
