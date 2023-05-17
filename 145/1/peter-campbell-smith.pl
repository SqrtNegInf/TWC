#!/usr/bin/env perl
use v5.36;

my (@tests, $test, @a, @b, $j, $p, $dp, $string1, $string2);

@tests = ([[1, 2, 3], [4, 5, 6]], [[93, 72, 11], [-1, 1000, 0]], [[1, 2, 3, 4], [1, 2, 3]]);

for $test (@tests) {
	
	# extract arrays
	@a = @{$test->[0]};
	@b = @{$test->[1]};
	say qq[\n\@a = (] . join(', ', @a) . qq[)];
	say qq[\@b = (] . join(', ', @b) . qq[)];
	
	# check lengths
	if (scalar @a != scalar @b) {
		say 'Not the same length';
		next;
	}
	
	# make dot product and required output text
	$string1 = $string2 = '';
	$dp = 0;
	for $j (0 .. scalar @a - 1) {
		$p = $a[$j] * $b[$j];
		$dp += $p;
		$string1 .= qq[($a[$j] * $b[$j]) + ];
		$string2 .= qq[$p + ];
	}
	
	say '$dot_product = ' . substr($string1, 0, -2) . '=> ' . substr($string2, 0, -2) . qq[=> $dp];
		
}	
	

