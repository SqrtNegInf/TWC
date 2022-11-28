#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my (@tests, $test, $flip);

@tests = (5, 4, 6, 127, 128, 1234, 999999, 7294019678);

# loop over tests
while ($test = shift @tests) {
	$flip = sprintf('%b', $test);
	say qq[\nInput:  $test = 0b$flip];
	
	# 'not' the input and remove leading ones
	$flip = sprintf('%b', ~ $test);
	$flip =~ s|^1+||;
	say qq[Output: ] . oct('0b' . $flip) . qq[ = 0b$flip];	 
}
