#!/usr/bin/env perl

use strict;
use warnings;

my @words = ("ab", "de", "ed", "bc");
maximum_pairs(\@words);

@words = ("aa", "ba", "cd", "ed");
maximum_pairs(\@words);

@words = ("uv", "qp", "st", "vu", "mn", "pq");
maximum_pairs(\@words);

exit 0;

sub maximum_pairs {
    my $words = shift || [];

    my %freq;
    foreach my $w (@$words) {
        $freq{$w} = $freq{(scalar reverse $w)}
            ? 2
            : 1;
    }
    printf "%s -> %d\n", (join ' ', @$words ), scalar map { $freq{$_} == 2 ? 1 : () } keys %freq;

    return undef;
}
