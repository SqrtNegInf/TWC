#!/usr/bin/env perl

use strict;
use warnings;

my $N = 10;
print trailing_zeroes($N), "\n";

#
#
# METHOD

sub trailing_zeroes {
    my ($n) = @_;

    die "ERROR: Missing number.\n"
        unless defined $n;
    die "ERROR: Invalid number (<= 10).\n"
        if (($n <= 0) || ($n > 10));

    # generate factorial
    $n *= $_ for 1..$n-1;

    # count trailing zeroes
    $n =~ m/[1-9]?([0]+)$/;

    return (defined $1)?(length($1)):(0);
}
