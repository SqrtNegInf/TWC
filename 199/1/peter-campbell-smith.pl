#!/usr/bin/env perl

use v5.36;

my (@tests, $test, @list, $i, $j, $count, $rubric);
@tests = ([1, 2, 3, 1, 1, 3], [1, 2, 3], [1, 1, 1, 1], [1, 3, 5, 7, 9, 1, 3, 5, 7, 9, 1]);

# loop over tests
for $test (@tests) {
	
	# initialise
	@list = @$test;	
	$count = 0;
	$rubric = '';
	
	# loop over first candidate
	for $i (0 .. scalar(@list) - 2) {
		
		# loop over second candidate
		for $j ($i + 1 .. scalar(@list) - 1) {
			
			# check for goodness
			if ($list[$i] == $list[$j]) {
				$count ++;
				$rubric .= qq[($i, $j) - both equal $list[$i]\n];
			}
		}
	}
	
	# report
	say qq[Input:  (] . join(', ', @list). qq[)\nOutput: $count];
	say $rubric ? qq[Good pairs are:\n$rubric] : '';
}
