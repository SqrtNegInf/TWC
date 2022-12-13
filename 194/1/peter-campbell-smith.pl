#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

my (@tests, $test, @chars, $result);

@tests = ('?5:00', '?3:00', '1?:00', '2?:00', '12:?5', '12:5?');

# loop over tests
for $test (@tests) {
	@chars = split(//, $test);
	
	if ($chars[0] eq '?') {        # ?1:30 or ?5:30
		$result = $chars[1] > 3 ? '1' : '2';
		
	} elsif ($chars[1] eq '?') {   # 1?:30 or 2?:30
		$result = $chars[0] eq '2' ? '3' : '9';
		
	} elsif ($chars[3] eq '?') {   # 11:?0
		$result = '5';
		
	} elsif ($chars[4] eq '?') {   # 11:3?
		$result = '9';
		
	} else {
		$result = 'invalid';
	}
	say qq[\nInput:  $test\nOutput: $result];
}
