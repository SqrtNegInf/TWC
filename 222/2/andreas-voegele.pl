#!/usr/bin/env perl
use v5.36;

sub last_member (@ints) {
    my @sorted_ints = sort { $b <=> $a } @ints;
    my ($x, $y) = splice @sorted_ints, 0, 2;
    if (defined $x) {
        if (defined $y) {
            my $delta = abs $y - $x;
            if ($delta != 0) {
                push @sorted_ints, $delta;
            }
            return last_member(@sorted_ints);
        }
        return $x;
    }
    return 0;
}

say last_member(2, 7, 4, 1, 8, 1);
say last_member(1);
say last_member(1, 1);
