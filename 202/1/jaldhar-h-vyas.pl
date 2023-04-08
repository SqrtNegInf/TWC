#!/usr/bin/env perl
use v5.36.0;
use warnings;

my $result = 0;
my @A = (2,3,5,7);

for my $i (0 .. scalar @A - 3) {
    if ($A[$i] % 2 && $A[$i + 1] % 2 && $A[$i + 2] % 2) {
        $result = 1;
        last;
    }
}

say $result;
