#!/usr/bin/env perl

use strict;
use warnings;

my $n = shift // 8;
die "Argument must be natural number.\n" unless $n =~ /^[1-9][0-9]*$/;

my @happy;
my $i = 1;

while ($n > @happy) {
	push @happy, $i if is_happy ($i);
	$i++;
}

print "@happy\n";

sub is_happy {
	my $x    = shift;
	my %seen = ($x => 1);

	while ($x != 1) {

		# Sum the squares of the digits
		my $sum = 0;
		$sum += chop ($x) ** 2 for 1 .. length $x;

		# Have we looped?
		return 0 if $seen{$sum};

		# Store it and go again
		$seen{$x = $sum} = 1;
	}

	return 1;
}
