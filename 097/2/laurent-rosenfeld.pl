#!/usr/bin/env perl
use v5.36;

my ($in_string, $size) = ('101100101',3);
my $sub_str_len = length($in_string) / $size;
my $flips = 0;
for my $i (0 .. $sub_str_len - 1) {
    my $ones = 0;
    for my $j (0 .. $size - 1) {
        my $idx = $j * $sub_str_len + $i;
        $ones++ if substr ($in_string, $idx, 1) == 1;
    }
    my $zeroes = $size - $ones;
    $flips += $zeroes > $ones ? $ones : $zeroes;
}
say $flips;
