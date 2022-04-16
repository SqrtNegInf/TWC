#!/usr/bin/env raku

my @arr1 = <I L O V E Y O U>;
my @arr2 = <2 4 0 3 2 0 1 9 5 6 7 8>;
my @arr3 = <! ? £ $ % ^ & * ( )>;

sub print_intertwined(**@arrs) {
    my $sub_arr_max = max(($_.elems for @arrs));
    @arrs = ((|$_, " " xx $sub_arr_max - $_.elems).flat for @arrs);
    for [Z] @arrs -> @arr {
        say join(" ", @arr);
    }
}

print_intertwined(@arr1, @arr2, @arr3);
