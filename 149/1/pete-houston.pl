#!/usr/bin/env perl 
use v5.36;

use List::Util 'sum';

my $n      = $ARGV[0] // 20;
my @fib    = (0, 1);
my %is_fib = (0 => 1, 1 => 1);
my $i      = -1;
my @found;

die "Argument must be a natural number.\n" unless $n =~ /^[1-9][0-9]*$/;

while (@found < $n) {
	# Sum the digits
	my $sum = sum split //, ++$i;

	while ($sum > $fib[-1]) {

		# Add an element to the Fibonacci list
		my $next = $fib[-2] + $fib[-1];
		push @fib, $next;

		# Pop it in the hash too
		$is_fib{$next} = 1;
	}
	push @found, $i if $is_fib{$sum};
}

print "f($n) = [" . join (', ', @found) . "]\n";
