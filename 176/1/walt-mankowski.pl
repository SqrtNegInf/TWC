#!/usr/bin/env perl
use v5.36;

sub sorted_digits($x) {
    return join '', sort split //, $x;
}

my $i = 1;
my $done = 0;
while (!$done) {
    my $sorted = sorted_digits($i);
    for my $j (2..6) {
        last unless sorted_digits($i * $j) == $sorted;
        if ($j == 6) {
            for my $k (1..6) {
                printf "%d ", $i * $k;
            }
            say "";
            $done = 1;
        }
    }
    $i++;
}
