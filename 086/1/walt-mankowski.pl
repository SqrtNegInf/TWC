#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);

my @n = (10, 8, 12, 15, 5);
my $a = 7;;

my $res = 0;
my $iter = combinations(\@n, 2);
while (my $c = $iter->next) {
    if (abs($c->[0] - $c->[1]) == $a) {
        $res = 1;
        last;
    }
}

say $res;
