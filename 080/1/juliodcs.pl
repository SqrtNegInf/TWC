#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(uniq);

sub min_slot {
    my $expected = 1;
    for my $number ( uniq sort {$a - $b} grep {$_ > 0} (5, 2, -2, 0) ) {
        return --$expected if $expected++ != $number;
    }
    return 0; # no empty *slot*
}

say 'Min slot: ' . min_slot;
