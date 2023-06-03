#!/usr/bin/env perl
use v5.36;

use List::Util qw(first);

say smallest_positive_number_missing((5, 2, -2, 0));

sub smallest_positive_number_missing( @xs) {
    my %lookup = map { $_ => 1 } @xs;
    return first { !$lookup{$_} } 1 .. ( @xs + 1 );
}

