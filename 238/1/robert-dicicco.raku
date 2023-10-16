#!/usr/bin/env raku

my @myints = ([1, 2, 3, 4, 5],[1, 1, 1, 1, 1],[0, -1, 1, 2]);

for (@myints) -> @mints {
    my $sum = 0;
    my @out = ();
    say "Input: \@int = ", @mints;
    for (@mints) -> $i {
        @out.push($i + $sum);
        $sum += $i;
    }
    say "Output: ",@out,"\n";
}
