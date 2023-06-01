#!/usr/bin/env perl
use v5.36;

sub solve {
	my @nodelist = @_;

	# Are we beyond the end?
	return 0 unless defined $nodelist[0];

	# Are we at the end?
	return 1 if $#nodelist == 0;

	# 0 is a tarpit
	return 0 if $nodelist[0] == 0;
	
	# Try the allowed jumps starting with the largest
	for my $step (reverse (1 .. $nodelist[0])) {
		return 1 if solve (@nodelist[$step .. $#nodelist]);
	}
	return 0;
}
