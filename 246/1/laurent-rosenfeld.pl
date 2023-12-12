#!/usr/bin/env perl
use v5.36;

srand 1;

my %result;
while (%result < 6) {
    # get random integers in the range 1..49
    my $rand = int( rand 49) + 1;
    # discard duplicates
    $result{$rand} = 1 unless exists $result{$rand};
}
say join " ", sort keys %result;
