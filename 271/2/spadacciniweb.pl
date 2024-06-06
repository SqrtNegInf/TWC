#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my @ints = (0, 1, 2, 3, 4, 5, 6, 7, 8);
sort_by_1_bits(\@ints);

@ints = (1024, 512, 256, 128, 64);
sort_by_1_bits(\@ints);

sub sort_by_1_bits {
    my $ints = shift;

    my %binary;
    foreach my $int (@ints) {
        push @{ $binary{ sum split //, sprintf '%b', $int } }, $int;
    }
    printf " (%s) -> (%s)\n",
        ( join ', ', @ints ),
        ( join ', ', map { sort { $a <=> $b } @{ $binary{$_} } }
            sort { $a <=> $b } keys %binary
        );
}
