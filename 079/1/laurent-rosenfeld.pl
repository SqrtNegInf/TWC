#!/usr/bin/env perl
use strict;
use warnings;
use feature "say";

my $n = 4;
my $sum;
for my $num (1..$n) {
    $sum += $_ for split '', sprintf "%b", $num;
}
say $sum % 1000000007;
