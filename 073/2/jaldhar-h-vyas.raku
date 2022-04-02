#!/usr/bin/env raku

    my @A = (7, 8, 3, 12, 10);
    my @output;

    for (0 ..^ @A.elems) -> $i {
        my $lowest = @A[0 .. $i - 1].grep({ $_ < @A[$i]; }).min;
        @output.push($lowest == ∞ ?? 0 !! $lowest);
    }

    @output.join(q{ }).say;
