#!/usr/bin/env raku

my @myints = ([4, 4, 2, 4, 3],[1, 1, 1, 1, 1],[4, 7, 1, 10, 7, 4, 1, 1]);
for (@myints) -> @ints {
    my $cnt = 0;
    say "Input: \@ints = ",@ints;
    for @ints.combinations(3) -> @i {
        if ((@i[0] != @i[1]) && (@i[1] != @i[2]) && (@i[0] != @i[2])) {
            $cnt++;
        }
    }
    say "Output: $cnt\n";
}
