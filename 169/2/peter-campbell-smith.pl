#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw[factor];

my ($test, @pf, $f, $result, $count, $dpf, %seen, $p, $rarest_factor, $good);

# loop from 1 up until done
TEST: for ($test = 1, $count = 0; $count < 20; $test ++) {
	
	# get prime factors
	@pf = factor($test);
	
	# test for powerfulness
	$dpf = 0;
	%seen = ();
	for $f (@pf) {
		
		# discard unless $test is a multiple of prime factor $f squared
		next TEST unless $test % ($f ** 2) == 0;
		
		# count distinct prime factors and their frequency
		$dpf ++ unless $seen{$f};
		$seen{$f} ++;
	}
	
	# test for imperfection
	next unless $dpf >= 2;
	
	# test for not a perfect power: first find the least frequently repeating prime factor
	$rarest_factor = ~0;
	for $f (keys %seen) {
		last if $seen{$f} == 1;
		$rarest_factor = $seen{$f} if $seen{$f} < $rarest_factor;
	}
	
	# then check that at least one other pf repeats a non-multiple of time the least frequent
	$good = 0;
	for $f (keys %seen) {
		$good = 1 if $seen{$f} % $rarest_factor != 0;
	}
	next TEST unless $good;
	
	# accumulate answers
	$result .= qq[$test, ];
	$count ++;
}

# tell the world
say substr($result, 0, -2);
