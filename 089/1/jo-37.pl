#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Math::Utils 'gcd';
use List::Util 'reduce';

sub gcd_sum {
	my $n = shift;
	reduce {
		local *_ = \$b;
		$a + reduce {$a + gcd($_, $_ + $b)} 0 .. $n - $b;
	} 0 .. $n - 1;
}

is gcd_sum(3), 3, 'Example 1';
is gcd_sum(4), 7, 'Example 2';
is gcd_sum(5), 11;
is gcd_sum(6), 20;
is gcd_sum(100), 13015;

done_testing;
