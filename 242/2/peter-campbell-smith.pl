#!/usr/bin/env perl
use v5.36;

flip_matrix([1, 1, 0],
            [0, 1, 1],
            [0, 0, 1]);
			
flip_matrix([1, 1, 0, 0], 
			[1, 0, 0, 1], 
			[0, 1, 1, 1], 
			[1, 0, 1, 0]);

flip_matrix([1, 0, 0, 0, 0],
			[0, 1, 0, 0, 0],
			[0, 0, 1, 0, 0],
			[0, 0, 0, 1, 0],
			[0, 0, 0, 0, 1]);

sub flip_matrix {
	
	my ($n, $j, @row, @flipped);
	
	# reverse and flip
	$n = @{$_[0]} - 1;		
	for $j (0 .. $n) {
		@row = @{$_[$j]};
		$flipped[$j][$_] = 1 - $row[$n - $_] for (0 .. $n);
	}
	
	# show input and output
	print_matrix(qq(\nInput:  [), \@_);
	print_matrix(qq(\nOutput: [), \@flipped)
}

sub print_matrix {
	
	my ($legend, $matrix, $j);

	# format rows of matrix
	($legend, $matrix) = @_;
	for $j (0 .. @$matrix - 1) {
		say qq[$legend] . join(', ', @{$matrix->[$j]}) . qq(]);
		$legend = '        [';
	}
}
		
