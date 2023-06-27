#!/usr/bin/env perl 
use v5.36;

sub isdisjoint { 
    my ($s1, $s2) = @_;
    my %h1 = map { $_ => 1 } @$s1; 
    for my $d (@$s2) { return 0 if exists $h1{$d}; }
    return 1; 
}

say isdisjoint [1, 2, 5, 3, 4], [4, 6, 7, 8, 9];
say isdisjoint [1, 3, 5, 7, 9], [0, 2, 4, 6, 8];
