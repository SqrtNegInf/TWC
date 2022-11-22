#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my (@tests, $test, @sorted, $largest, $second, $this);

@tests = ([1, 2, 3, 4], [1, 2, 0, 5], [2, 6, 3, 1], [4, 5, 2, 3], [1, 5, 16, 28, 35, 44, 50, 61, 78, 83, 99, 200]);

# loop over tests
while ($test = shift @tests) {
	
	# method A
 	 @sorted = reverse sort {$a <=> $b} @$test;
	 say qq[\nInput:    \@list = (] . join(', ', @$test) . qq[)\nOutput A: ] . ($sorted[0] >= 2 * $sorted[1] ? '1' : '-1');

	# method B 
	$largest = $second = 0;
	for $this (@$test) {
		if ($this > $largest) {
			$second = $largest;
			$largest = $this;
		}
	 }
	 say qq[Output B: ] . ($largest >= 2 * $second ? '1' : '-1');		 
}
