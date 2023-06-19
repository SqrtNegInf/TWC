#!/usr/bin/env perl
use v5.36;

use List::Util qw(reduce);

sub next_numbers ($acc, $distance, @ints) {
    my $a = $acc->[-1];
    while (@ints > 0) {
        my $b = shift @ints;
        if (abs $a - $b == $distance) {
            push @{$acc}, $b;
            $a = $b;
        }
    }
    return $acc;
}

sub subsequences ($acc, @ints) {
    if (@ints >= 2) {
        my $a = shift @ints;
        subsequences($acc, @ints);
        while (@ints > 0) {
            my $b = shift @ints;
            my $distance = abs $a - $b;
            push @{$acc}, next_numbers([$a, $b], $distance, @ints);
        }
    }
    return $acc;
}

sub arithmetic_subsequences (@ints) {
    return @{subsequences([], @ints)};
}

sub longest_length (@sequences) {
    my $longest_sequence = reduce { @{$a} > @{$b} ? $a : $b } @sequences;
    return scalar @{$longest_sequence};
}

say longest_length(arithmetic_subsequences(9, 4, 7, 2, 10));
say longest_length(arithmetic_subsequences(3, 6, 9, 12));
say longest_length(arithmetic_subsequences(20, 1, 15, 3, 10, 5, 8));
