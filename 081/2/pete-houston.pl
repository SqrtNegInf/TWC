#!/usr/bin/env perl
use v5.36;

use List::MoreUtils 0.420 'occurrences';

# Optionally open the file
my $f = 'input.txt'; #\*STDIN;
open my $fh, '<', $f;

# Convert the input into an array of words
my @words;
while (<$fh>) {
	s/[."(),]|'s|--//g;
	push @words, split;
}

# Find and display the frequencies
my @occ = occurrences (@words);
for my $i (0 .. $#occ) {
	print "$i: " . join (' ', sort @{$occ[$i]}) . "\n" if defined $occ[$i];
}
