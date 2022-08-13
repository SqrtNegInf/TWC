#!/usr/bin/env perl

use feature 'say';

my @reversible;
for my $i (10 .. 99) {

	my $sum = $i + reverse ($i) + 0;

	push @reversible, $i
	  if  length ($sum) == grep { $_ % 2 }
	      split //, $sum
}

say "Reversible Numbers are " . join(" ", @reversible);
