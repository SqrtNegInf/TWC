#!/usr/bin/env perl
use v5.36;

use List::Util qw(all sum0);
use Scalar::Util qw(looks_like_number);

run() unless caller();

sub run() {
    my @xs = (1, 3, 5, 7, 9);
    die "Expect a list of integers!\n" unless all { m/^-?\d+$/ } @xs;

    say equilibrium_index(@xs);
}

sub equilibrium_index(@xs) {
    for my $i ( 0 .. $#xs  ) {
        my $lower = sum0( @xs[ 0 .. $i - 1 ] );
        my $upper = sum0( @xs[ $i + 1 .. $#xs ] );
        return $i if $lower == $upper;
    }

    return -1;
}
