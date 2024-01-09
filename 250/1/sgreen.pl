#!/usr/bin/env perl
use v5.36;

sub main (@ints) {
    my $solution = -1;

    # Loop through each position
    foreach my $idx ( 0 .. $#ints ) {
        # The index mod 10 is the value at this position
        if ( $idx % 10 == $ints[$idx] ) {
            # We have the best solution, so no need to continue looping
            $solution = $idx;
            last;
        }
    }

    say $solution;
}

main(@ARGV);
