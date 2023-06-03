#!/usr/bin/env perl
use v5.36;

use List::Util qw/min none/;

# Start at highest possible potential divisor
my $i = min ((100, 500));
my @div;

# Iterate downwards to 1
while ($i > 0) {
	push @div, $i if none { $_ % $i } (100, 500);
	$i--;
}

print "@div\n";
