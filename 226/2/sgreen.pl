#!/usr/bin/env perl
use v5.36;

use List::Util 'uniq';

sub main (@ints) {
    # The solution is the number of uniq positive integers
    my $count = scalar( uniq grep { $_ != 0 } @ints );
    say $count;
}

main((1, 5, 0, 3, 5));
