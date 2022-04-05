#!/usr/bin/env raku

sub MAIN (Int $nb_digits = 2, Int $sum = 10) {
    my $max = -1 + $sum <= 9
        ?? $sum * 10 ** ($nb_digits -1)
        !! 10 ** $nb_digits;
    for 10 ** ($nb_digits - 1) .. $max -> $num {
        say $num if $num.comb.sum == $sum;
    }
}
