#!/usr/bin/env perl

use strict;
use warnings;

print join $/, center("This", "is", "a test of the", "center function");

sub center {
    my @lines = @_;
    my $max = 0;
    map { $max = length($_) if (length($_) > $max) } @lines;
    return map { ' 'x(($max-length($_))/2).$_ } @lines
}
