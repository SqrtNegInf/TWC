#!/usr/bin/env perl
use v5.36;

say $_ for get_stepping_numbers(111,999);

sub get_stepping_numbers ( $low, $high ) {
    my @output;
    for my $n ( $low .. $high ) {
        my @n = split //, $n;
        push @output, $n
            if off_by_one( $n[0], $n[1] ) && off_by_one( $n[1], $n[2] );
    }
    return @output;
}

sub off_by_one ( $i, $j ) {
    return 1 if $i == $j + 1;
    return 1 if $i == $j - 1;
    return 0;
}
