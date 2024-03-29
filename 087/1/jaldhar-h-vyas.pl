#!/usr/bin/env perl
use v5.36;

my @N = sort { $a <=> $b } (100, 4, 50, 3, 2);

my @sequence = ( $N[0] );
my @longest;

for my $i (1 .. scalar @N - 1) {
    if ($N[$i] == $N[$i - 1] + 1) {
        push @sequence, $N[$i];

        if (scalar @sequence > scalar @longest) {
            @longest = @sequence;
        }

    } else {
        @sequence = ( $N[$i] );
    } 
}

say scalar @longest ? (q{(} . (join q{, }, @longest) . q{)}) : 0;
