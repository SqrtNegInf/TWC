#!/usr/bin/env perl
use v5.36;

srand 1;

use List::Uniq ':all';

my ($j, @test);

max_xor(1, 2, 3, 4, 5, 6, 7);
max_xor(2, 4, 1, 3);
max_xor(10, 5, 7, 12, 8);
max_xor(21, 25);
max_xor(32, 32, 32, 32);

for $j (1 .. 20) {
	@test[$j - 1] = int(rand(126)) + 1;
}
max_xor(@test);

sub max_xor {
	
	my ($count, $i, $j, $max, $xor, $result, @array, $largest, $limit);
	
	@array = @_;
	$count = scalar @array;

	# find the largest number in the array
	$largest = 0;
	for $j (@array) {
		$largest = $j if $j > $largest;
	}
	
	# find the largest possible xor
	for $j (1 .. 31) {
		next unless 2 ** $j > $largest;
		$limit = 2 ** $j - 1;
		last;
	}

	# now scan for the largest xor
	$max = -1;
	if ($count >= 2) {
		SCAN: for $i (0 .. $count - 2) {
			for $j ($i + 1 .. $count - 1) {
				$xor = $_[$i] ^ $_[$j];
				if ($xor > $max) {
					$result = qq[$array[$i] xor $array[$j] = $xor];
					$max = $xor;
					last SCAN if $max == $limit;
				}
			}
		}
		say qq[\nInput:  \@array = (] . join(', ', @_) . ')' . qq[\nOutput: $result];
	} else {
		say 'Array must contan at least 2 elements.'
	}
}
