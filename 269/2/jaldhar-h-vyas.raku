#!/usr/bin/env raku

sub MAIN(
    @ints = [5, 4, 3, 8]
) {
    my @arr1 = @ints.shift;
    my @arr2 = @ints.shift;
    for @ints.keys -> $k {
        @arr1[*-1] > @arr2[*-1] ?? @arr1.push(@ints[$k]) !! @arr2.push(@ints[$k]);
    }

    say q{(},  @arr1.push(| @arr2).join(q{, }), q{)};
}
