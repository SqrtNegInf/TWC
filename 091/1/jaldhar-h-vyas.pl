#!/usr/bin/env perl
use 5.020;
use warnings;

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
