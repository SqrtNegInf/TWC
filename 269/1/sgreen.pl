#!/usr/bin/env perl
use v5.36;

sub main (@ints) {
    # Count the number of even number integers
    my $even_count = grep { $_ % 2 == 0 } @ints;

    # True if there are two or more of them
    say $even_count >= 2 ? 'true' : 'false';
}

main( (1,2,3,4,5) );
