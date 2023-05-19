#!/usr/bin/env perl
use v5.36;

my ($lists, $list, $this, $result, $prev);

# inputs to test
$lists = [[1, 2, 3, 4, 5], [1, 2, 5, 4, 3], [2, 1, 3, 4, 5], [1, 100, 100, 12345, 123456789, 123456788], 
	[-1, 0, 0, 0, 0, 1], [-100..100, 99],
	[12.34, 12.35, 12.36], [-1e6 + 0.1, -1e5-0.1, 1e4 + 0.1, 1e4 + 0.100001]];

# loop over inputs
for $list (@$lists) {
	say 'Input:  ' . join(', ', @$list);
	
	# assume good until proved otherwise
	$result = 1;
	$prev = $list->[0];
	for $this (@$list) {
		$result = $this < $prev ? 0 : 1;
		last unless $result;   # no need to check the rest of the list
		$prev = $this;
	}
	say "Output: $result\n";
}
