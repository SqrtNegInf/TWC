#!/usr/bin/env perl

use v5.36;
use utf8;
use warnings;

dup_and_miss(1, 2, 3, 3, 5);
dup_and_miss(7, 7, 8, 9, 11);
dup_and_miss(7, 8, 9, 11, 11);
dup_and_miss(4, 5, 6, 7, 8, 8, 9, 10, 11, 12, 13, 15);
dup_and_miss(1, 2, 3, 4, 5);

sub dup_and_miss {
	
	my (@list, $j, $duplicate, $missing);
	
	@list = @_;
	
	# scan through the list up to the second last entry
	for $j (0 .. scalar @list - 2) {
		
		# if this one is the same as the next one, then this one's a duplicate
		if ($list[$j] == $list[$j + 1]) {
			invalid(@list) if $duplicate;
			$duplicate = $list[$j];
		
		# if this one is 2 less than the next one, then this one plus one is missing		
		} elsif ($list[$j] + 2 == $list[$j + 1]) {
			invalid(@list) if $missing;
			$missing = $list[$j] + 1;
			
		# or the list is invalid
		} elsif ($list[$j] + 1 != $list[$j + 1]) {
			invalid(@list);
		}
	}

	say qq[\nInput:  \@nums = (] . join(', ', @list) . q[)];
	say qq[Output: ] . ((defined $duplicate and defined $missing) ? 
		qq[Duplicate is $duplicate and Missing is $missing.] : -1);
}

sub invalid {
	say qq[\nInvalid input: \@list = (] . join(', ', @_) . q[)];
	exit;
}
		
