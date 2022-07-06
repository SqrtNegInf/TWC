#!/usr/bin/env perl

use v5.28;
use strict;
use warnings;
use utf8;
use Math::Prime::Util qw(divisors);
binmode(STDOUT, ':utf8');

my ($count, $i, @divisors, $sum);

# loop over odd numbers
$count = 0;
for ($i = 1; $count < 20; $i += 2) {
	
	# add the divisors
	@divisors = divisors($i);
	$sum = 0;
	$sum += $_ for @divisors;
	
	# we have an AON if the sum exceeds 2i
	if ($sum > 2 * $i) {
		$count ++;
		say qq[aon[$count] = $i because σ($i) = $sum which is more than 2 * $i = ] . (2 * $i);
	}
}
