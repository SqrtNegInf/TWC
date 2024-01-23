#!/usr/bin/env perl
use v5.36;

sub main ($n) {
    my @solution = ();
    my $half = int($n / 2);

    # If we have an odd number, add a zero
    if ($n % 2 == 1) {
        push @solution, 0;
    }

    foreach my $i (1 .. $half) {
        # Add a pair of numbers
        unshift @solution, -$i;
        push @solution, $i;
    }

    say join ', ', @solution;
}

main(5);
