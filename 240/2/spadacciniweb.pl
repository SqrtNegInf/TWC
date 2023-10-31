#!/usr/bin/env perl

use strict;
use warnings;

my @arrs = ([0, 2, 1, 5, 3, 4],
            [5, 0, 1, 2, 3, 4]
           );

foreach my $arr (@arrs) {
    foreach my $e (@$arr) {
        if ($e >= scalar @$arr) {
            print "Element too big\n";
            exit 1;
        }
    }
    printf "(%s) -> Output: (%s)\n",
        (join ', ', @$arr),
        (join ', ', map { $arr->[$_] } @$arr)
}
