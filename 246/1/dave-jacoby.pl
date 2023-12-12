#!/usr/bin/env perl

use strict;
use warnings;
use experimental qw{ say postderef signatures state };

srand 1;

my %hash;


while ( scalar keys %hash < 6 ) {
    my $n = 1 + int rand 49;
    $hash{$n} = 1;
}

say join "\n", sort { $a <=> $b } keys %hash;
