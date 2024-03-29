#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum/;

# Store the answers
my @answers;

# Default $N and $S
my $N = shift // 2;
my $S = shift // 10;

# Calculate start and end
my $start = 10 ** ($N - 1);
my $end   = (10 ** $N) - 1;

# Process each number
for my $i ($start .. $end) {
    my @numbers = split(//, $i);
    push @answers, $i
    	if (sum(@numbers) == $S);
}

# Display answers
say join ', ', @answers;
