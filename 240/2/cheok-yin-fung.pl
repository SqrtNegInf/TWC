#!/usr/bin/env perl
use v5.36;

sub ba {
    my @int = @_;
    my @new = map {$int[$int[$_]]} (0..$#int);
    return [@new];
}

use Test::More tests=>2;
use Test::Deep;

cmp_deeply ba(0, 2, 1, 5, 3, 4), [0, 1, 2, 4, 5, 3];
cmp_deeply ba(5, 0, 1, 2, 3, 4), [4, 5, 0, 1, 2, 3];
