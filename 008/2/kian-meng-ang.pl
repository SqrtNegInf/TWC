#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);
use String::Pad qw(pad);

sub center {
    my (@lines) = @_;

    my $max_width = max map { length } @lines;
    return [ map { pad($_, $max_width, 'c') } @lines ];
}

say join qq|\n|, @{center('This', 'is', 'a test of the', 'center function')};
