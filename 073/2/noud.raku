#!/usr/bin/env raku

sub smallest-neighbour(@A) {
    my $smallest = @A[0] + 1;
    gather for @A -> $a {
        if ($smallest <= $a) {
            take $smallest;
        } else {
            $smallest = $a;
            take 0;
        }
    }
}

smallest-neighbour((7, 8, 3, 12, 10)).say;
smallest-neighbour((4, 6, 5)).say;
