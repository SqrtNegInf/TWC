#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);

for my $num (1 .. 20) {
	say sum0 grep {
		$num % $_ == 0
	} 2 .. int($num / 2);
}
