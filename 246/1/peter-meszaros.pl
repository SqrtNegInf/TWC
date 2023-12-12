#!/usr/bin/env perl

use strict;
use warnings;

srand 1;

sub six_outof_fortynine
{
    my %h;

    while (keys %h < 6) {
        $h{int(rand(48))+1}++;
    }
    return sort {$a <=> $b} keys %h;
}

for my $i (1..10) {
    printf "%2d %s\n", $i, join('-', map { sprintf("%2d", $_) } six_outof_fortynine());
}

exit 0;


