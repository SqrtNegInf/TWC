#!/usr/bin/env perl

use v5.26;    # The Weekly Challenge - 2024-01-29
use strict;   # Peter Campbell Smith
use warnings; 

three_power(27);
three_power(0);
three_power(6);
three_power(1);
three_power(1853020188851840);
three_power(1853020188851841);
three_power(2197000000000000);
three_power(205891132094649);


sub three_power {
	
	# initialise
	my ($n, $j, $try, $limit);
	$n = shift;
	say qq[\nInput:  $n];
	if ($n > 2197000000000000) {
		say qq[-- too big (max is 2197000000000000)];
		return;
	}
	
	# powers of 3
	$try = 1;
	for $j (0 .. 33) {
		if ($try == $n) {
			say qq[Output: true,  $n is 3 ** $j];
			last;
		} elsif ($try > $n) {
			say qq[Output: false, $n is not a power of 3];
			last;
		}
		$try *= 3;
	}
	
	# cubes
	for $j (0 .. 130000) {
		$try = $j ** 3;
		if ($try == $n) {
			say qq[        true,  $n is $j ** 3];
			last;
		} elsif ($try > $n) {
			say qq[        false, $n is not a perfect cube];
			last;
		}
	}
}
