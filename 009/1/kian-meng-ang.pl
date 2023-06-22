#!/usr/bin/env perl
use v5.36;

use constant MAX_DISTINCT_DIGITS => 5;

my $n = 1;
while ($n) {
    my $square_number = $n ** 2;

    # See https://www.perlmonks.org/?node_id=240191
    my %digits;
    @digits{ split '', $square_number } = ();

    if (scalar keys %digits >= MAX_DISTINCT_DIGITS) {
        say $square_number;
        last;
    }

    $n++;
}
