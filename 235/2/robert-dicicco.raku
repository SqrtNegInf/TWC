#!/usr/bin/env raku

my @myints = ([1, 0, 2, 3, 0, 4, 5, 0],[1, 2, 3],[0, 3, 0, 4, 5]);

for (@myints) -> @mints {
    say  "Input: \@ints = ",@mints;
    my @seen = ();
    my $len = @mints.elems - 1;
    for (@mints) -> $x {
        if $x != 0 {
            @seen.push: $x;
        } else {
            @seen.push: 0;
            @seen.push: 0;
        }
    }
    say "Output: [@seen[0..$len]]\n";
}
