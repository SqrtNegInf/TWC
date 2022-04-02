#!/usr/bin/env raku

sub MAIN(
    @A = (1, 2, 2, 3, 2, 4, 2)
) {
    my %count = @A.classify({ $_; });
    my $N = (@A.elems / 2).floor;

    (%count.keys.grep({ %count{$_} > $N; }) || (-1)).join(q{ }).say;
}
