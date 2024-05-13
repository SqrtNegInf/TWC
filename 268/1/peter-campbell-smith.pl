#!/usr/bin/env perl

use v5.26;    # The Weekly Challenge - 2024-05-06
use warnings; # Peter Campbell Smith

magic_number([3, 7, 5], [9, 5, 7]);
magic_number([1, 2, 1], [5, 4, 4]);
magic_number([2], [5]);
magic_number([9, 10, 11, 12], [2, 1, 0, -1]);

sub magic_number {
	
	# show input
	say qq[\nInput: ] . sprintf('@x = (%s), @y = (%s)',
		join(', ', @{$_[0]}), join(', ', @{$_[1]}));
		
	# show output	
	say qq[Output: ] . 
		([sort {$a <=> $b} @{$_[1]}]->[0] - 
		 [sort {$a <=> $b} @{$_[0]}]->[0]);
}
