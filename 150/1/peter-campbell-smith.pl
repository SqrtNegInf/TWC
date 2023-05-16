#!/usr/bin/env perl
use v5.36;

my ($a, $b, $index, $j, $test, @fib, @tests);

# sets of inputs to test ($a, $b, character index of interest)
@tests = (['1234', '5678', 51], ['12345678', '98765432', 159], ['1', '2', 1000]);

# loop over tests
for $test (@tests) {
	
	# get parameters
	($fib[0], $fib[1], $index) = @$test;
	
	# create successive ternms of series until one is long enough
	$j = 1;
	while (1) {
		$j ++;
		$fib[$j] = $fib[$j - 2] . $fib[$j - 1];
		last if length($fib[$j]) >= $index;
	}
	
	# format the answer
	say qq[\nInput:  $fib[0], $fib[1]];
	say qq[Term $j is $fib[$j] (] . length($fib[$j]) . ' characters long)';
	say qq[Character $index is ] . substr($fib[$j], $index - 1, 1);
}
