#!/usr/bin/env raku

my @L = -25, -10, -7, -3, 2, 4, 8, 10;
my $T = 3;
 
    for @L.combinations(3) -> @combo {
        my @triplet = @combo.sort;

        my $total = [+] @triplet;

        if ($total == $T) {
            @triplet.join(q{ }).say;
        }
    }
