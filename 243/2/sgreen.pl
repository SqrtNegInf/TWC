#!/usr/bin/env perl
use v5.36;

use List::Util 'sum';
use POSIX 'floor';

sub main (@ints) {
    my $solution = 0;
    foreach my $i (@ints) {
        $solution += sum( map { floor( $i / $_ ) } @ints );
    }

    say $solution;
}

main(@ARGV);
