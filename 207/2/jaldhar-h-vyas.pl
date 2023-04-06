#!/usr/bin/env perl
use 5.36.0;

my $hindex = 0;

my @A = (10,8,5,4,3);

for my $h (1 .. scalar @A) {
    if ($A[$h - 1] < $h) {
        last;
    }
    $hindex = $h;
}

say $hindex;
