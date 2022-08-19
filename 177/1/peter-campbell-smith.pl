#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my (@table, @tests, $test, $interim_digit);

@table = (
[0, 3, 1, 7, 5, 9, 8, 6, 4, 2], 
[7, 0, 9, 2, 1, 5, 4, 8, 6, 3], 
[4, 2, 0, 6, 8, 7, 1, 3, 5, 9], 
[1, 7, 5, 0, 9, 8, 3, 4, 2, 6], 
[6, 1, 2, 3, 0, 4, 5, 9, 7, 8], 
[3, 6, 7, 4, 2, 0, 9, 5, 8, 1], 
[5, 8, 6, 9, 7, 2, 0, 1, 3, 4], 
[8, 9, 4, 5, 3, 6, 2, 0, 1, 7], 
[9, 4, 3, 8, 6, 1, 7, 2, 0, 5], 
[2, 5, 8, 1, 4, 3, 6, 7, 9, 0]);
			 
@tests = (5724, 5725, 85670934565, 85760934565, 85680934565);

for $test (@tests) {
	
	# start with zero
	$interim_digit = 0;
	
	# loop over digits
	while ($test =~ m|(\d)|g) {
		$interim_digit = $table[$interim_digit][$1];
	}
	
	# number is valid if $interim_digit is zero
	say qq[$test is ] . ($interim_digit ? 'not ' : '') . qq[valid];
}
		
