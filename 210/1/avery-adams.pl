#!/usr/bin/env perl

use strict;
use v5.10;

my %hash;
$hash{$_}++ for <1 1 2 2 2 3 3>;

my $max;
for my $int (keys %hash) {
    my $total = (($int - 1) * $hash{$int - 1}) + ($int * $hash{$int}) + (($int + 1) * $hash{$int + 1});
    $max = $total if $total > $max or !defined($max);
}

say $max if defined $max;
