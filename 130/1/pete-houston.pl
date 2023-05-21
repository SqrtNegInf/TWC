#!/usr/bin/env perl
use v5.36;

my %freq;
# Count up the occurrences of each positive integer
my @A = (2, 5, 4, 4, 5, 5, 2);
$freq{$_}++ for map { s/[^0-9]+//g; $_ } @A;
# Remove the entry for bad data, if present
delete $freq{''};
# Extract those integers with odd frequencies
my @odds = grep { $freq{$_} % 2 } keys %freq;

if ($#odds < 0) {
	die "No arguments occurred an odd number of times.\n";
} elsif ($#odds > 0) {
	die "More than one argument occurred an odd number of times.\n";
} else {
	print "$odds[0]\n";
}
