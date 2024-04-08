#!/usr/bin/env perl

use strict;
use warnings;

my @ints = (1, 5, 3, 2, 4, 2);
my $k = 2;
list_of_indices(\@ints, $k);

@ints = (1, 2, 4, 3, 5);
$k = 6;
list_of_indices(\@ints, $k);

@ints = (5, 3, 2, 4, 2, 1);
$k = 4;
list_of_indices(\@ints, $k);

exit 0;

sub list_of_indices {
    my $ints = shift;
    my $k = shift;

    my @ints = sort { $a <=> $b } @$ints;
    my @indexes;
    while (my ($idx, $value) = each(@ints) ) {
        push @indexes, $idx
            if $value == $k;
    }
    printf "(%s) -> (%s)\n",
        (join ',', @$ints),
        (join ',', @indexes);

    return undef;
}
