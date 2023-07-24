#!/usr/bin/env perl
use v5.36;

use experimental qw(for_list);

use List::Util qw(mesh);

sub shuffle_string ($string, $indices) {
    my @chars;
    for my ($i, $c) (mesh $indices, [split //, $string]) {
        $chars[$i] = $c;
    }
    return join q{}, @chars;
}

say shuffle_string('lacelengh', [3, 2, 0, 5, 4, 8, 6, 7, 1]);
say shuffle_string('rulepark', [4, 7, 3, 1, 0, 5, 2, 6]);
