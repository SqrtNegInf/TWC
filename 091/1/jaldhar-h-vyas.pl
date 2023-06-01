#!/usr/bin/env perl
use v5.36;

my $N = shift // 1122234;

my $current = 0;
my $count = 0;

for my $i (split //, $N) {
    if ($i == $current) {
        $count++;
    } else {
        if ($current != 0) {
            print "$count$current";
        }
        $current = $i;
        $count = 1;

    }
}

print "$count$current\n";
