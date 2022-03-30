#!/usr/bin/env perl

use strict;
use warnings;

# result of 3?

my %hash;
%hash = map { $_ => 1 } (5, 2, -2, 0);

my @sorted = sort { $a <=> $b } keys %hash;

# Print 1 if there are no positive numbers in @sorted.
print "1\n" and exit 0
    if $sorted[$#sorted] < 1;


while (my $arg = shift @sorted) {
    next if $arg < 1;
    print "1\n" and exit 0 unless $arg == 1;
    last;
}

MAIN: foreach my $num (2 ... $sorted[$#sorted] + 1) {
    foreach (@sorted) {
        shift @sorted and next MAIN if $num == $_;
        print "$num\n" and last MAIN;
    }
    # Print the last element if it was a continous series of positive
    # numbers.
    print "$num\n";
}
