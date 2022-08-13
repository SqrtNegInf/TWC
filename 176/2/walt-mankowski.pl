#!/usr/bin/env perl
use v5.36;

sub is_reversible($i) {
    return ($i + scalar reverse $i) !~ /[02468]/;
}

my @reversible;
for my $i (1..99) {
    push @reversible, $i if is_reversible($i);
}

say "@reversible";
