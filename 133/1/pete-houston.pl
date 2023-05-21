#!/usr/bin/env perl
use v5.36;

print "Integer square root of 10 is " . isqrt (10) . "\n";

# Woo's Abacus method
sub isqrt {
	use integer;
	my $in   = shift;
	my $root = 0;
	my $top  = 1 << 30;
	$top >>= 2 while $top > $in;

	while ($top) {
		if ($in >= $root + $top) {
			$in   -= $root + $top;
			$root += 2 * $top;
		}
		$root /= 2;
		$top  /= 4;
	}
	return $root;
}
