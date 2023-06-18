#!/usr/bin/env perl
use v5.36;

my ($stones, $jewels) = ('chancellor', 'chocolate');

my %alphabet = map { $_ => 0 } split //, $stones;

my $count = grep { exists $alphabet{$_} } split //, $jewels;

say $count;
