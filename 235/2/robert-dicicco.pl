#!/usr/bin/env perl
use v5.36;

my @myints = ([1, 0, 2, 3, 0, 4, 5, 0],[1, 2, 3],[0, 3, 0, 4, 5]);

for my $mints (@myints) {
    say "Input: \@ints = [@$mints]";
    my @seen = ();
    my $len = scalar @$mints - 1;
    for my $x (@$mints) {
        if ($x != 0) {
            push(@seen, $x);
        } else {
            push(@seen, 0);
            push(@seen, 0);
        }
    }
    say "Output: [@seen[0..$len]]\n";
}
