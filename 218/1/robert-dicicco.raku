#!/usr/bin/env raku

my @lists = ([3, 1, 2],[4, 1, 3, 2],[-1, 0, 1, 3, 1],[-8, 2, -9, 0, -4, 3]);

my $maxval = 0;

my $threelist = 0;
my @threelist = ();

for (@lists) -> @lst {
    for @lst.combinations(3) -> @combo {
        my $threeval = [*] @combo;
        if $threeval > $maxval {
            $maxval = $threeval;
            @threelist = @combo;
        }
    }
    say "Input: \@list = ",@lst;
    say "Output: ",$maxval;
    @threelist = @threelist.sort;
    say @threelist[0], " x ", @threelist.[1], " x ", @threelist[2], " = $maxval";
    @threelist = ();
    $maxval = 0;
    say "";
}
