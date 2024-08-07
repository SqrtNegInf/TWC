#!/usr/bin/env perl
use v5.36;

my @ints = [1, 2, 2, 4, 1, 5];

my %freq;

for my $int (@ints) {
    $freq{$int}++;
}

my $max = 0;
my $output = 0;

while (my ($k, $v) = each %freq) {
    if ($v > $max) {
        $max = $v;
        $output = 1;
    } elsif ($v == $max) {
        $output++;
    }
}

say $output;
