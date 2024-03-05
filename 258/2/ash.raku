#!/usr/bin/env raku

my @ints = 2, 5, 9, 11, 3;
my $k = 1; # 17
# my $k = 2; # 11
# my $k = 0; # 2

if $k {
    my @indices = (
            (1..*).grep({
                $_.base(2).comb.grep(/1/).elems == $k
            })
        )[^@ints];
    say [+](@ints[@indices].grep: *.defined);
}
else {
    say @ints[0]; # Otherwise no @indices will be ever filled.
}
