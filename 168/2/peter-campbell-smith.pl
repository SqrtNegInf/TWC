#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;
use utf8;
use Math::Prime::Util qw[factor is_prime];

my ($test, $hp);

for $test (2 .. 12) {
	$hp = home($test);
	say qq[hp($test) = $hp];
}

sub home {
	
	my (@prime_factors, $concat);
	
	# get prime factors
	@prime_factors = factor(shift);
	
	# concatenate them
	$concat .= $_ for @prime_factors;
	
	# either we have an answer or need to go round again
	return $concat if is_prime($concat);
	home($concat);
}
