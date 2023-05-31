#!/usr/bin/env perl
use v5.36;

my @input = ("opt", "bat", "saw", "tab", "pot", "top", "was");

my %anagrams;

foreach (@input) {
    my $key = join '', sort split //;
    push @{$anagrams{$key}}, $_;
}

say foreach sort map {join ', ', @$_} values %anagrams;
