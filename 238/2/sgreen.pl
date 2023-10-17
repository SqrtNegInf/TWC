#!/usr/bin/env perl
use v5.36;

use List::Util 'product';

sub main (@ints) {
    my %steps = ();
    foreach my $i (@ints) {
        # Calculate the steps required for each int to get a single digit
        $steps{$i} = 0;
        my $num = abs($i);

        while ( length($num) > 1 ) {
            $num = product( split //, $num );
            $steps{$i}++;
        }
    }

    # Sort the integers in ascender order, and then by the steps required
    my @sorted_ints = sort { $steps{$a} <=> $steps{$b} || $a <=> $b } @ints;

    say '(', join( ', ', @sorted_ints ), ')';
}

main((15, 99, 1, 34));
