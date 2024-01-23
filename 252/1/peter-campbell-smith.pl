#!/usr/bin/env perl
use v5.36;

srand 1;

my ($j, @ints);

special_numbers(1, 2, 3, 4);
special_numbers(2, 7, 1, 19, 18, 3);
special_numbers(7, 7, 7, 7, 11);

for $j (0 .. 31) {
	push @ints, int(rand(20) + 1);
}
special_numbers(@ints);

sub special_numbers {
	
	my (@ints, $j, $squares, @specials, $last);
	
	# initialise
	@ints = @_;
	$last = @ints - 1;
	
	# check each member
	for $j (0 .. $last) {
		if (($last + 1) / ($j + 1) == int(($last + 1) / ($j + 1))) {
			$squares += $ints[$j] ** 2;
			push @specials, $j + 1;
		}
	}
	
	# show results
	say qq[\nInput:  \@ints = (] . join(', ', @ints) . ')';
	say qq[Output: $squares ∵ \@specials: ] . join(', ', @specials);
}
