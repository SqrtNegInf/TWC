#!/usr/bin/env perl
use v5.36;

my $order = 1;
my @xs = (5, 9, 2, 8, 1, 6);

foreach (1 .. $order) {
    foreach my $i (0 .. $#xs-1) {
        $xs[$i] = $xs[$i+1] - $xs[$i];
    }
    pop @xs;
}

print "@xs\n";
