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

my @A = (7, 8, 3, 12, 10);

if (!scalar @A) {
    usage();
}

my @output;

for my $i (0 .. scalar @A - 1) {
    my $lowest = min([ grep { $_ < $A[$i]; } @A[0 .. $i - 1] ]);
    push @output, $lowest // 0;
}

say join q{ }, @output;
