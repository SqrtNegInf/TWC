#!/usr/bin/env perl
use v5.36;

my @a = (2,13,10,8);

my $min_sum = 1e300;
my $min_num = 1e300;

for my $bits (0 .. 2**@a - 1) {
    my $sum = 0;
    my $num = 0;
    for my $i (0..$#a) {
        if ($bits & 2**$i) {
            $sum += $a[$i];
        } else {
            $sum -= $a[$i];
            $num++;
        }
    }
    if (0 <= $sum < $min_sum) {
        $min_sum = $sum;
        $min_num = $num;
    } elsif ($sum == $min_sum && $num < $min_num) {
        $min_num = $num;
    }
}

say "min sum = $min_sum min num = $min_num";

