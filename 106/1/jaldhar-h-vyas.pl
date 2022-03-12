#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_vars /;

    my @N = sort <1 3 8 2 0>;

    my $previous = $N[0];
    my $largest = -Inf;
    for my $i (1 .. scalar @N - 1) {
        my $gap =  $N[$i] - $previous;
        if ($gap > $largest) {
            $largest = $gap;
        }
        $previous = $N[$i];
    }
    say $largest;
