#!/usr/bin/env perl
use v5.36;

my @ints = (15, 99, 1, 34);
my %steps;

for my $int (@ints) {
    my $n = $int;
    my $s = 0;
    while (length $n > 1) {
        my $t = 1;
        my @digits = split //, $n;
        for my $digit (@digits) {
            $t *= $digit;
        }
        $n = $t;
        $s++;
    }
    $steps{$int} = $s;
}

my @sorted = sort { $steps{$a} <=> $steps{$b} || $a > $b } keys %steps;

say q{(}, (join q{, }, @sorted), q{)};
