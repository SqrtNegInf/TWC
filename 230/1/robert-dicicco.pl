#!/usr/bin/env perl
use v5.36;

my @myints = ([1, 34, 5, 6], [1, 24, 51, 60]);


for my $ints (@myints) {
    my $str = '';
    say "Input: \@ints = (@$ints)";
    for my $digit (@$ints) {
        $str .= $digit;
    }
    my @arr = (split("",$str));
    say "Output: (@arr)\n";
}
