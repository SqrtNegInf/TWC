#!/usr/bin/env raku

sub MAIN(
    #*@N #= a series of atleast 2 distinct integers. The last element will be
    ##    #= used as a target to search in the previous elements.
    #where {@_.elems > 1 }
) {
    my @N = <1 2 3 4 3>;
    my $N = @N.pop;
    my $pos = @N.elems;

    for 0 ..^ @N.elems -> $i {
        if @N[$i] >= $N {
            $pos = $i;
            last;
        }
    }

    say $pos;
}
