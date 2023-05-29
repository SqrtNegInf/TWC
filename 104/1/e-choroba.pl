#!/usr/bin/env perl
use v5.36;

sub fusc {
    my ($l) = @_;
    my @seq = (0, 1);
    while (@seq < $l) {
        my $n = @seq;
        push @seq, (sub { $seq[ $n / 2 ]},
                    sub { $seq[ ($n + 1) / 2] + $seq[ ($n - 1) / 2] }
                )[$n % 2]->();
    }
    return @seq
}

use Test::More tests => 1;

is_deeply [fusc(50)],
    [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3, 4, 1, 5, 4, 7, 3, 8,
     5, 7, 2, 7, 5, 8, 3, 7, 4, 5, 1, 6, 5, 9, 4, 11, 7, 10, 3, 11, 8,
     13, 5, 12, 7, 9, 2, 9]; # from OEIS.

