#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util 'is_prime';

# Write a script to find out all Additive Primes <= 100.
# Additive primes are prime numbers for which the sum of their decimal digits are also primes.

# blog: https://pjcs-pwc.blogspot.com/2022/03/all-about-primes.html

my ($j, $s);

for $j (1 .. 100) {
	next unless is_prime($j);
	$s = $j % 10 + int($j / 10) % 10 + int($j / 100) % 10;
	say qq[$j is an additive prime whose digits sum to $s] if is_prime($s);
}
