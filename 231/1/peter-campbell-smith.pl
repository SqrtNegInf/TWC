#!/usr/bin/env perl
use v5.36;

min_max(3, 2, 1, 4);
min_max(7, 2, 8, 4, 5, 1, 6, 0, 11, 34, 23, 76, 99, 24);
min_max(5, 6);
min_max(7, 6, 5);

sub min_max {
	
	say qq[\nInput:  (] . join(', ', @_) . ')';
	say qq[Output: (] . (scalar @_ < 3 ? -1 : join(', ', (sort {$a <=> $b} @_)[1 .. scalar @_ - 2])) . ')';
}
