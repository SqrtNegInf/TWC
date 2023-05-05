#!/usr/bin/env perl
use v5.36;

my ($j, $j_sorted, $j_length, $k, $jk, );

# method 1
say 142857;

# method 2

# loop from 10 to <big>
J: for $j (10 .. 1000000) {
	
	# sort the digits of $j and get its length
	$j_sorted = sorted($j);
	$j_length = length($j);
	
	# test 2x, 3x, 4x, 5x, 6x products
	for $k (2 .. 6) {
		$jk = $j * $k;
		
		# $j is no good if the product has more digits than $j, or they aren't the same digits
		next J if (length($jk) > $j_length or sorted($jk) ne $j_sorted);
	}
	
	# and if all that passes, we have the answer
	say $j;
	exit;
}

sub sorted {
	
	# sorts the characters of a string
	return join('', sort(split(//, $_[0])));
}
	
