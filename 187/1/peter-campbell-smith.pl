#!/usr/bin/env perl

use v5.36;
my (@days_in_month, @tests, $test, $j, $day, $month, @day_of_year, 
	$start_together, $end_together, $time_together);

@days_in_month = (0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

@tests = ([qw[12-01 20-01 15-01 18-01]], [qw[02-03 12-03 13-03 14-03]], 
		  [qw[02-03 12-03 11-03 15-03]], [qw[30-03 05-04 28-03 02-04]],
	      [qw[01-01 31-12 01-01 31-12]], [qw[01-xx 02-02 03-03 04-04]],
		  [qw[01-01 01-01 01-01 01-01]]);

TEST: for $test (@tests) {
	
	# show input
	say qq[\nInput: Foo => SD: '$test->[0]' ED: '$test->[1]'\n] .
          qq[       Bar => SD: '$test->[2]' ED: '$test->[3]'];
	
	# convert dates to day of year (1 Jan -> 1, 31 Dec -> 365)
	for $j (0 .. 3) {
		if ($test->[$j] =~ m|^(\d\d)\-(\d\d)$|) {
			($day, $month) = ($1, $2);
			$day_of_year[$j] = $day;
			while ($month > 1) {
				$day_of_year[$j] += $days_in_month[$month - 1];
				$month --;
			}
		} else {
			say 'Invalid data';
			next TEST;
		}
	}
	
	# the overlap period is from the later of the starts and the earlier of the ends
	$start_together = $day_of_year[0] > $day_of_year[2] ? $day_of_year[0] : $day_of_year[2];
	$end_together = $day_of_year[1] < $day_of_year[3] ? $day_of_year[1] : $day_of_year[3];
	$time_together = $end_together - $start_together + 1;
	
	# if negative then there is no overlap
	$time_together = 0 if $time_together < 0;
	
	say qq[Output: $time_together day] . ($time_together == 1 ? '' : 's');
}


