#!/usr/bin/env perl
use v5.36;

use strict;
use warnings;

for my $n (100 .. 999) {
    my %unique;
    my ($f,$s,$t) = split //, $n;
    @unique{$f, $s, $t, $f*$s, $s*$t, $f*$s*$t} = (1) x 6;
    print $n.$/ if keys %unique == 6;
}
