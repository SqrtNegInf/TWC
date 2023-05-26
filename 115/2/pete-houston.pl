#!/usr/bin/env perl
use v5.36;

# Sort ascending
my @n = sort (4, 1, 7, 6);

# Find the lowest even digit
my ($i) = grep { 0 == $n[$_] % 2 } 0 .. $#n;

# If no even digits the task is impossible
die "No multiple of 2 possible with (@ARGV)\n" unless defined $i;

# Print digits descending but with lowest even digit at the end
unshift @n, splice (@n, $i, 1) if $i;
say reverse @n;
