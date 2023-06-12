#!/usr/bin/env perl
use v5.36;

sub is_colourful3 {
    my ($x, $y, $z) = split //, $_[0];
    my %seen;
    $seen{$_}++ and return 0 for $x, $y, $z, $x*$y, $y*$z, $x*$y*$z;
    return 1;
}

say for grep is_colourful3($_), 111..987;
