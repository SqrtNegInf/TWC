#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my ($input, @tests, $test, @array, $largest, $position, $j);

@tests = ([5, 2, 9, 1, 7, 6, 9], 
	[4, 2, 3, 1, 5, 0], 
	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
	[-2, -7, -10, -5, -14]);

TEST: for $test (@tests) {
	
	# initialise and show input
	@array = @$test;
	$input = '';
	$input .= qq[$_, ] for @array;
	say qq[\nInput:  (] . substr($input, 0, -2) . ')';
	
	# look for the largest
	$largest = -1e6;
	for $j (0 .. $#array) {
		next if $array[$j] <= $largest;
		$largest = $array[$j];
		$position = $j;
	}
	say qq[Output: $position (largest value = $array[$position])];
}
	
