#!/usr/bin/env perl
use v5.36;

sub smaller_ints ( $ints, $target ) {
    # Count the number of integers that are less than the target
    return scalar( grep { $_ < $target } @$ints );
}

sub main (@ints) {
    my @results = map { smaller_ints( \@ints, $_ ) } @ints;
    say '(', join( ', ', @results ), ')';
}

main(  (5, 2, 1, 6) );
