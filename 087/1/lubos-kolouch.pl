#!/usr/bin/env perl
use v5.36;

sub get_sequence {
	my $input = shift;

	my @longest_seq;
	my @curr_seq;

	# loop through the sorted array
	for my $v (sort {$a <=> $b} @$input) {

		# if the seq is empty or the next number is consecutive, add it
		if ( (not @curr_seq) or ($v == $curr_seq[$#curr_seq]+1) ) {
			push @curr_seq, $v;
		} else {
			# sequence broken, remember it if it the longest
			if ($#curr_seq > $#longest_seq) {
				@longest_seq = @curr_seq;
				@curr_seq = [];
			}
		}
	}

	# if longes sequence has just 1 item, we haven't found anything
	return 0 unless $#longest_seq > 1;

	return \@longest_seq;
}

use Test::More;

is_deeply(get_sequence([100, 4, 50, 3, 2]), [2, 3, 4]);
is_deeply(get_sequence([20, 30, 10, 40, 50]), 0);
is_deeply(get_sequence([20, 19, 9, 11, 10]), [9, 10, 11]);

done_testing;
