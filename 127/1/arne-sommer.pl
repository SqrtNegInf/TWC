#!/usr/bin/env perl
use v5.36;

my $S1 = '1 2 5 3 4', my $S2 = '4 6 7 8 9';

my @S1 = split(/\s+/, $S1);
my @S2 = split(/\s+/, $S2);

my %S1 = map { /^\d+$/ ? ($_ => 1) : die 'Non-integer value ' . $_ . ' in @S1' } @S1;
my %S2 = map { /^\d+$/ ? ($_ => 1) : die 'Non-integer value ' . $_ . ' in @S2' } @S2;

die '@S1 has duplicates' unless keys %S1 == @S1;
die '@S2 has duplicates' unless keys %S2 == @S2;

my %all = (%S1, %S2);

say 0 + (keys %all == %S1 + %S2);
