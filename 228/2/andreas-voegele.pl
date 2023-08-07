#!/usr/bin/env perl
use v5.36;

sub empty_array (@ints) {
    my $count = 0;
    my @mins  = sort { $a <=> $b } @ints;
    while (@ints > 0) {
        ++$count;
        my $first = shift @ints;
        if (@ints > 0) {
            if ($first > $mins[0]) {
                push @ints, $first;
            }
            else {
                shift @mins;
            }
        }
    }
    return $count;
}

say empty_array(3, 4, 2);
say empty_array(1, 2, 3);
