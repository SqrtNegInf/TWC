#!/usr/bin/env perl

use strict;
use warnings;

my $input = 4;

my $set_bits;
foreach my $num (1 ... $input) {
    my $binary = sprintf "%b", $num;
    my $count = $binary =~ tr/1//;
    $set_bits += $count;
}
print $set_bits % 1000000007, "\n";
