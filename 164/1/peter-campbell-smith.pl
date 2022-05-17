#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;

my (%primes, $j, $p, $results, $reverse);

# discover primes
%primes = ();
OUTER: for $j (2 ... 1000) {
	
	# not prime if $j divisible by a lesser prime
	for $p (keys %primes) {
		next OUTER if $j % $p == 0;
	}
	
	# found a prime, check for palindromicity
	$primes{$j} = 1;
	$reverse = '';
	$reverse = $reverse . $1 while $j =~ m|(.)|g;
	$results .= qq[$j, ] if $j == reverse($j);
}
say qq[\nThe following are palindromic primes:\n] . substr($results, 0, -2);
