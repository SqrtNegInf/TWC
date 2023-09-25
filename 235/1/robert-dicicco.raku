#!/usr/bin/env raku

my @myints = ([0, 2, 9, 4, 6],[5, 1, 3, 2],[2, 2, 3]);

for (@myints) -> @mints {
    say "Input: \@ints = ", @mints;
    my $len = @mints.elems;
    my $cnt = 0;
    my $x = 1;
    while $x < $len {
        if (@mints[$x] > @mints[$x - 1]) {
            say "\t@mints[$x] greater than @mints[$x - 1]";
            $x++;
        } else {
            say "\t@mints[$x] less than @mints[$x - 1]";
            $cnt++;
            $x++;
        }
    }
    $cnt == 1 ?? say "Output: true\n" !! say "Output: false\n";
}
