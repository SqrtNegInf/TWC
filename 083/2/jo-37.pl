#!/usr/bin/env perl

use Test2::V0 -srand => 1;
use List::Util 'sum';
use List::MoreUtils 'pairwise';
use Math::Utils 'copysign';
use Benchmark 'cmpthese';

# Count the minimum number of sign flips to achieve the mimimum signed
# sum.  The efford to find the solution with this brute-force
# implementation grows exponentially with the length of the given list
# of numbers.  For larger lists a smarter approach is required.
sub minflips {
	my ($minsum, $minflips) = ('inf');
	my $len = @_;

	# Take the sign flips from the ones in the binary representation of
	# a counter.
	foreach (map {sprintf "%0${len}b", $_} 1 .. 2**$len - 2) {

		# Apply ones in $_ as negative signs to the given numbers and
		# sum these.
		my $sum = sum pairwise {copysign $b, -$a} @{[split '']}, @_;

		# Skip sums out of range
		next if $sum < 0 || $sum > $minsum;

		# Count the number of flips, i.e. the number of ones in $_.
		my $flips = y/1/1/;

		# A smaller sum is taken as the new best solution or
		# a sum achieved with less flips.
		($minsum, $minflips) = ($sum, $flips)
			if $sum < $minsum || $flips < $minflips;
	}

	$minflips;
}

is minflips(3, 10, 8), 1, 'Example 1';
is minflips(12, 2, 10), 1, 'Example 2';
is minflips(2, 3, 5, 9, 4), 2; 
is minflips(4, 1, 1, 1), 3;
is minflips(2, 1, 1, 1), 1;
is minflips(2,13,10,8), 2;

done_testing;

