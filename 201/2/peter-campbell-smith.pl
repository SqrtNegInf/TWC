#!/usr/bin/env perl
use v5.36;

my (@tests, $n, $ways, $piles);

@tests = (1, 2, 3, 4, 5, 10);

# loop over tests
for $n (@tests) {
	
	# initialise
	$ways = 0;
	$piles = '';
	
	# find possible ways to do it
	find_ways($n, $n, '');
	
	# output results
	say qq[Input:  \$n = $n\nOutput: ] . $ways;
	say qq[Piles:\n$piles];
}	

sub find_ways {
	
	# returns the number of possible ways of stacking $pennies pennies in stacks no more than $height
	my ($pennies, $height, $stack) = @_;
	my ($h);

	# no pennies left - answer found
	if ($pennies == 0) {
		$piles .= qq[$stack\n];
		$stack = '';
		$ways ++;
		return;
	}
	
	# loop over possible piles
	for $h (1 .. ($pennies > $height ? $height : $pennies)) {
		find_ways($pennies - $h, $h, qq[$h $stack]);
	}
}
