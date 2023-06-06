#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

sub min {
    my @A = @{ $_[0] };
    my $least = $A[0];

    for my $i (1 .. scalar @A - 1) {
        if ($A[$i] < $least) {
            $least = $A[$i];
        }
    }

    return $least;
}

my $S = shift // 3;
my @A =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);

my @output;

for my $i (0 .. scalar @A - $S) {
    push @output, min([ @A[$i .. $i + $S - 1] ]);
}

say join q{ }, @output;
