#!/usr/bin/env perl
use v5.36;

use List::Util qw( sum );

say equilibrium_index((1, 3, 5, 7, 9));

sub equilibrium_index {
    my(@n) = @_;
    for my $i (1 .. $#n-1) {
        my $left = sum(@n[0..$i-1]);
        my $right = sum(@n[$i+1..$#n]);
        return $i if $left==$right;
        return -1 if $left>$right;
    }
    return -1;
}
