#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my $S = shift // 'ababcabd';

my @output;

for my $i (1 .. length $S) {
    my $slice = substr $S, 0, $i;
    my $fnr = '#';

    for my $c (split //, $slice) {
        my @matches = ($slice =~ /$c/g);
        if (scalar @matches == 1) {
            $fnr = $c;
        }
    }

    push @output, $fnr;
}

say join q{}, @output;
