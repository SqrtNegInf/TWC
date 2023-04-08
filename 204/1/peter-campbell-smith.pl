#!/usr/bin/env perl

use v5.36;
use utf8;
use warnings;
use Time::HiRes qw(time);

my (@tests, $test, @array, $direction, $next, $result, $j);

@tests = ([1, 2, 2, 3], [1, 3, 2], [6, 5, 5, 4], [7, 7, 7, 6, 8], [5, 5, 5, 5, 5]);

for $test (@tests) {
	
	@array = @$test;
	
	$result = 1;
	$direction = 0;
	for $j (0 .. scalar(@array) - 2) {
		$next = $array[$j + 1] <=> $array[$j];
		unless ($direction) {
			$direction = $next;
		} else {
			unless ($next == $direction or $next == 0) {
				$result = 0;
				last;
			}
		}
	}
	say qq[\nInput:  (] . join (', ', @array) . qq[)];
	
	say qq[Output: $result] . ($result == 0 ? '' :
		($direction > 0 ? ' increasing' : ($direction < 0 ? ' decreasing' : ' level')));
}	

