#!/usr/bin/env perl
use v5.36;

sorted_squares(-2, -1, 0, 3, 4);
sorted_squares(5, -4, -1, 3, 6);
sorted_squares(5.3, -77.62, 11, 0, 3.14159, 2.1728);

sub sorted_squares {

	# square the list items and then sort them
	say qq[\nInput:  \@list = (] . join(', ', @_) . ')';
	say qq[Output: (] . join (', ', sort { $a <=> $b } map { $_ ** 2 } @_) . ')';
}

