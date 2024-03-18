#!/usr/bin/env raku

sub MAIN(
    @ints  = (1,2,2,1,1,3)
) {
    my %count;
    @ints.map({ %count{$_}++ });
    say %count.values.elems == %count.values.unique.elems ?? 1 !! 0;
}
