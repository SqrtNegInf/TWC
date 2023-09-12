#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniqstr);

sub normalize($word) {
    join '', uniqstr sort split //, $word
}

my @words = ("aba", "aabb", "abcd", "bac", "aabc");

my $similar = 0;

my %seen;
for my $word (@words) {
    $similar += $seen{normalize $word}++;
}

say $similar;
