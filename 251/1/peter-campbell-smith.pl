#!/usr/bin/env perl
use v5.36;

srand 1;

my ($j, @ints);

concatenation_value(6, 12, 25, 1);
concatenation_value(10, 7, 31, 5, 2, 2);
concatenation_value(1, 2, 10);

for $j (0 .. 99) {
	push(@ints, int(rand(99)));
}
concatenation_value(@ints);

sub concatenation_value {
	
	my(@ints, $sum, $j, $k);
	
	# initialise
	@ints = @_;
	$sum = 0;
	
	# iterate from both ends
	for $j (0 .. @ints) {
		$k = @ints - $j - 1;
		last if $k < $j;
		$sum += ($k == $j ? $ints[$j] : $ints[$j] . $ints[$k]);
	}
	
	# show result
	say qq[\nInput:  (] . join(', ', @ints) . ')';
	say qq[Output: $sum];
}
