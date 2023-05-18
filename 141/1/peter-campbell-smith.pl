#!/usr/bin/env perl
use v5.36;

my ($test, @tests, $try, $divisor, $dividend, $key, $count, $string, $num, $how_many, $num_divisors,
	$max_try, $z);

# inputs - pairs of number of results to show and number of divisors required
@tests = ([10, 8]);
$max_try = 10000;

# loop over tests
for $test (@tests) {
	($how_many, $num_divisors) = @$test;
	say qq[\nSmallest $how_many numbers (up to $max_try) having $num_divisors divisors:];

	# initialise
	$num_divisors --;
	$how_many -= 1;
	$num = 0;

	# loop over integers
	TRY: for $try (2..$max_try) {
		$count = 0;     # number of divisors found
		$string = '';   # list of divisors

		# loop over potential divisors
		for $divisor (1..int($try/2)) {
			$dividend = $try/$divisor;

			# if it is a divisor
			if ($dividend eq int($dividend)) {
				$count ++;
				$string .= qq[$divisor, ];
				next TRY if $count > $num_divisors;   # give up if there are too many
			}
		}

		# if there were exactly the number of divisors requested we have an answer
	    if ($count == $num_divisors) {
			say qq[$try has divisors $string$try];    # add the number itself to the list
			last if $num ++ >= $how_many;               # stop if we have enough answers
		}
	}
}
