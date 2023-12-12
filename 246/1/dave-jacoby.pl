#!/usr/bin/env perl
use v5.36;

srand 1;

my %hash;


while ( scalar keys %hash < 6 ) {
    my $n = 1 + int rand 49;
    $hash{$n} = 1;
}

say join "\n", sort { $a <=> $b } keys %hash;
