#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;
use utf8;

sub generate_pascal_row {
    my $n = shift;

    my @rows = (1);
    foreach my $k (0..$n - 1) {
        push @rows, $rows[$k] * ($n - $k) / ($k + 1);
    }
    return \@rows;
}

my $n = 9 || die "Expect number of row";
say "$_: @{generate_pascal_row($_)}" for (0..$n);
