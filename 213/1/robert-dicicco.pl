#!/usr/bin/env perl

use v5.36;

my @lists = ([1,2,3,4,5,6],[1,2],[1]);

for my $arr (@lists) {
    say "Input: \@list = (@{$arr})";
    my @odds =  grep { $_ % 2 } @{$arr};
    my @evens = grep { $_ % 2 == 0 } @{$arr};
    my @combo = (@evens, @odds);
    say "(".join( ',', @combo ).")";
    say " ";
}
