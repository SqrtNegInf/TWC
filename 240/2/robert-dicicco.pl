#!/usr/bin/env perl
use v5.36;

my @myints = ([0, 2, 1, 5, 3, 4],[5, 0, 1, 2, 3, 4]);

for my $mints (@myints) {
    my @out = ();
    say "Input: \@ints = [@$mints]";
    for (my $cnt = 0; $cnt < scalar @$mints; $cnt++ ) {
        push(@out, $mints->[$mints->[$cnt]]);
    }
    say "Output: [@out]\n";
}
