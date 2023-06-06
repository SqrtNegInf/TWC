#!/usr/bin/env perl
use v5.36;

sub fnr {
	# Given a string, return a string of last non-repeating chars for
	# the substrings up to incrementing positions.
	my $in = shift;
	my (%seen, @sorted, @fnr);
	for my $char (split //, $in) {
		unless (exists $seen{$char}) {
			$seen{$char} = 1;
			unshift @sorted, $char;
			push @fnr, $char;
		} elsif ($seen{$char} > 1) {
			push @fnr, $fnr[-1];
		} else {
			$seen{$char}++;
			my ($this) = grep { $seen{$_} == 1; } @sorted;
			push @fnr, $this // '#';
		}
	}
	return join '', @fnr;
}

for my $str ('ababcabd') {
	my $fnr = fnr ($str);
	print "FNR for '$str' is $fnr\n";
}
