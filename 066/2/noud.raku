#!/usr/bin/env raku

sub power-int($n) {
    my @r = ((2..$n**.5) X (2..$n**.5)).grep({ $_[0] ** $_[1] eq $n});

    if (@r.elems == 0) {
        say 0;
    } else {
        say "$_[0]^$_[1]" for @r;
    }
}

say "Example 1, N=9:";
power-int(9);

say "Example 2, N=45:";
power-int(45);

say "Example 3, N=64:";
power-int(64);
