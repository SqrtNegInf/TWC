#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my @A = (7, 8, 3, 12, 10);
my @output = (0);
my $min = $A[0];

for my $x (@A[1..$#A]) {
    push @output, $min < $x ? $min : 0;
    $min = $x if $x < $min;
}

say "@output";
