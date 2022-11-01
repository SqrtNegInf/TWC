#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;
binmode(STDOUT, ':utf8');

my (@tests, $x, $y, $ops);

# test input (pairs of x, y)
@tests = (5, 4,  4, 6,  2, 5,  3, 1,  7, 4, 987, 654);

# loop over tests
TEST: while ($tests[0]) {
	
	# initialise
	$x = shift @tests;
	$y = shift @tests;
	$ops = 0;
	say qq[\nInput:  \$x = $x, \$y = $y];
	
	# apply rules
	while ($x > 0 and $y > 0) {
		if ($x >= $y) {
			$x -= $y;
		} else {
			$y -= $x;
		}
		$ops ++;
	say qq[x $x y $y];
	}
	# and the answer
	say qq[Output: $ops];
}

