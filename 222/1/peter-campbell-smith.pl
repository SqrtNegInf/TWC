#!/usr/bin/env perl
use v5.16;

use strict;
use warnings;

srand 1;

my ($j, @list);

matching_members(1, 1, 4, 2, 1, 3);
matching_members(5, 1, 2, 3, 4);
matching_members(1, 2, 3, 4, 5);

# longer example
for $j (0 .. 29) {
	$list[$j] = int(rand(25));
}
matching_members(@list);

sub matching_members {
	
	my (@list, @sorted, $j, $result, $count);
	
	# initialise
	@list = @_;
	@sorted = sort { $a <=> $b } @list;
	$result = '';
	$count = 0;
	
	# loop over list
	for $j (0 .. scalar @list - 1) {
		next unless $list[$j] == $sorted[$j];
		$result .=  qq[$list[$j], ];
		$count ++;
	}
	
	# display results
	say qq[\nInput:  \@ints   = (] . join(', ', @list) . q[)] .
		qq[\n        \@sorted = (] . join(', ', @sorted) . q[)];
	say qq[Output: ] . $count . ($count > 0 ? ' : ' . substr($result, 0, -2) : '');
}
