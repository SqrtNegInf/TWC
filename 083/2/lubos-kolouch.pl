#!/usr/bin/env perl
use v5.36;

use List::Util qw/sum/;

sub get_nr_flips {

	my $arr = shift;

	# split the array into two sets, using the heuristic algorithm, which may
	# not be perfect, but runs fast!
	
	my @a = [];
	my @b = [];

	for my $i (sort {$b <=> $a} @$arr) {
		if (sum(@a) < sum(@b)) {
			push @a, $i;
		} else { 
			push @b, $i;
		}
	}

	# now flip the smaller list
	return scalar @a if scalar @a < scalar @b;

	return scalar @b;

}

print get_nr_flips([2,13,10,8]); print "\n";  # once in a great while flips and gets the right answer?

use Test::More;

is(get_nr_flips([3,10,8]), 1);
is(get_nr_flips([2,12,10]), 1);
is(get_nr_flips([2,13,10,8]), 1); # gets wrong answer

done_testing;
