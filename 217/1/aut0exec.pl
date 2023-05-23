#!/usr/bin/env perl
use v5.36;

sub flatten {
	my @matrix = ([3, 1, 2], [5, 2, 4], [0, 6, 3], [3, 4, 9]);
	my @flattened;
	my $matrix_len=@matrix;

	for(my $row = 0; $row < $matrix_len; $row++) {
		for(my $col = 0; $col < 3; $col++) {
			push @flattened, "$matrix[$row][$col]";
		}
	}

	return (sort { $a <=> $b } @flattened);
}

my @sorted = flatten();

print ("The sorted list of the given matrix: @sorted\n");
print ("The 3rd smallest of the sorted list is $sorted[2]\n");


