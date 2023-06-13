#!/usr/bin/env perl
use v5.36;

my @circle   = 1 .. 50;
my $position = 1;

while ( scalar @circle > 1 ) {
    if ( $position > scalar @circle ) {
        $position = 0;
    }
    splice @circle, $position, 1;
    $position++;
}

say "Survivor is at position $circle[0]";
