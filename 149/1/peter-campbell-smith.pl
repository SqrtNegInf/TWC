#!/usr/bin/env perl
use v5.36;

my ($n, $i, @fibs, @results);

$n = 20;

@fibs = (0, 1);   # initial fibonacci series
@results = ();

# count up until we have the required quantity of results
for ($i = 0; $#results < $n - 1; $i++) {
	push(@results, $i) if is_a_fib(eval(join('+', split(//, $i))));   # see note above
}

say qq[f($n) = (] . join(', ', @results) . ')';

sub is_a_fib {
	
	# returns true if the argument is a fibonacci number
	
	my ($arg, $i);
	$arg = $_[0];
	
	# make sure @fibs is long enough
	while ($arg > $fibs[$#fibs]) {
		$fibs[$#fibs + 1] = $fibs[$#fibs] + $fibs[$#fibs - 1];   # add one fib to @fibs
	}
	
	# check if $arg is in @fibs (binary chop would be faster but why bother?)
	for ($i = $#fibs; $i >= 0; $i--) {
		return 1 if $arg == $fibs[$i];
	}
	return 0;
}
		


