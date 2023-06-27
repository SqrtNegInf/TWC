#!/usr/bin/env perl
use v5.36;

sub dot_product {
    my(@ab) = @_;
    my $n = int(@ab/2);
    my $p = 0;
    for my $i (0..$n-1) {
        $p += $ab[$i]*$ab[$n+$i];
    }
    return $p;
}

say dot_product(1..6);
