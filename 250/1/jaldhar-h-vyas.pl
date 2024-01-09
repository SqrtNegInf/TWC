#!/usr/bin/env perl
use v5.36;

my $result = -1;

for my $i (0 .. scalar @ARGV - 1) {
    if ($ARGV[$i] % 10 == $i) {
        $result = $i;
        last;
    }
}

say $result;
