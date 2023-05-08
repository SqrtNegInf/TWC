#!/usr/bin/env perl

use v5.36;

sub odd_one_out {
    my @words = @{+shift};
    my $char = '';
    my $out = 0;
    say "Input: @words";
    for my $word (@words) {
        for my $c (split '', $word) {
            if ($char lt $c) {
                $char = $c;
            } else {
                $out += 1;
                last;
            }
        }
    }
    say "Output: $out";
}

while (<DATA>) {
    chomp;
    my @words = split ',';
    odd_one_out(\@words);
}

__DATA__
abc,xyz,tsu
rat, cab,dad
x,y,z
