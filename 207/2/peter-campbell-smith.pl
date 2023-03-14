#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

h_index(10, 8, 5, 4, 3);
h_index(25, 8, 5, 3, 3);
h_index(10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
h_index(0);
h_index();
h_index(4, 4, 4, 4);

sub h_index {
	
	my (@list, $j);
	
	# loop over list (0-based!) to find first where n'th number in list < $n
	@list = @_;
	for ($j = 0; $j < scalar @list; $j ++) {
		last unless $list[$j] >= $j + 1;
	}
	say qq[\nInput:  \@citations = (] . join(', ', @list) . 
		qq[)\nOutput: $j];
}
