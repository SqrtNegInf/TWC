#!/usr/bin/env perl

use strict;
use warnings;

use List::Util qw/ min /;

my @ints = (1,2,3,3,3,3,4,2);
appearance(\@ints);

@ints = (1,1);
appearance(\@ints);

@ints = (1,2,3);
appearance(\@ints);

exit 0;

sub appearance {
    my $ints = shift;

    my %ints;
    $ints{$_}++
        foreach @$ints;

     printf "(%s) -> %s\n",
        (join ',', @$ints),
        min ( grep { $ints{$_} / (scalar @$ints) >= 0.33 } keys %ints );
}
