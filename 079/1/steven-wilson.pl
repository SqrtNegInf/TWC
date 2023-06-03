#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my $num = 4;
my $cat_binary_strings;

die "Number was not positive" if $num < 1;

for (1 .. $num) {
    $cat_binary_strings .= sprintf("%b", $_);
}

my $total_set_bit_count = sum( split //, $cat_binary_strings );

say $total_set_bit_count % 1000000007;

