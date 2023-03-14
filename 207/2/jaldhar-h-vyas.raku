#!/usr/bin/env raku

sub MAIN(
    @citations = (10,8,5,4,3)
) {
    my $hindex = 0;

    for 1 .. @citations.elems -> $h {
        if @citations[$h - 1] < $h {
            last;
        }
        $hindex = $h;
    }

    say $hindex;
}
