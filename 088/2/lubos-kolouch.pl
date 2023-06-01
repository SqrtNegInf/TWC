#!/usr/bin/env perl
use v5.36;

sub get_spiral{
	my $in_arr = shift;

	my $x_max = scalar @$in_arr;
	my $y_max = scalar @{$in_arr->[0]};

	my @pos = (0, 0);
	my $direction = ">";

	my %seen_cells;
	my @out_arr;

	while (1) {

		return \@out_arr if scalar @out_arr == $x_max * $y_max;

		push @out_arr, $in_arr->[$pos[0]][$pos[1]] unless $seen_cells{$pos[0]}{$pos[1]};
		$seen_cells{$pos[0]}{$pos[1]} = 1;

		# can move in the direction we are walking?
		if ($direction eq ">") {
			if (($pos[1] + 1 < $x_max) and not ($seen_cells{$pos[0]}{$pos[1]+1})) {
				$pos[1]++;
			} else {
				$direction = "v";
			}
		}


		elsif ($direction eq "v") {
			if (($pos[0] + 1 < $y_max) and not ($seen_cells{$pos[0]+1}{$pos[1]})) {
				$pos[0]++;
			} else {
				$direction = "<";
			}
		}

		elsif ($direction eq "<") {
			if (($pos[0] - 1 >= 0) and not ($seen_cells{$pos[0]-1}{$pos[1]})) {
				$pos[0]--;
				next;
			} else {
				$direction = "^";
			}
		}

		elsif ($direction eq "^") {
			if (($pos[1] - 1 >= 0) and not ($seen_cells{$pos[0]}{$pos[1]-1})) {
				$pos[1]--;
				next;
			} else {
				$direction = ">";
			}
		}

	}

}

use Test::More;

is_deeply(get_spiral([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), [1, 2, 3, 6, 9, 8, 7, 4, 5]);
is_deeply(get_spiral([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]), [1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10 ]); 

done_testing();
