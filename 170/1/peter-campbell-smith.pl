#!/usr/bin/env perl
use v5.36;

my (@primes, $j, $p, @pm, $k);

@primes = ();
$p = 1;
$pm[0] = 1;
say qq[P(0) = 1];

OUTER: for $j (2 .. 99999) {
	for $k (@primes) {
		next OUTER if $j % $k == 0;   # $j is not prime if divisible by a smaller prime
	}
	
	# found a prime, create next primorial
	push @primes, $j;
	$pm[$p] = $pm[$p - 1] * $j;
	say qq[P($p) = $pm[$p]];
	$p ++;
	exit if $p == 10;
}
