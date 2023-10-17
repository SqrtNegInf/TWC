#!/usr/bin/env perl
use v5.36;

my @myints = ([1, 2, 3, 4, 5],[1, 1, 1, 1, 1],[0, -1, 1, 2]);

for my $mints (@myints) {
    my $sum = 0;
    my @out = ();
    say "Input: \@int = [@$mints]";
    for my $i (@$mints) {
        push(@out, $i + $sum);
        $sum += $i;
    }
    say "Output: [@out]\n";
}
