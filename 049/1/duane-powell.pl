#!/usr/bin/env perl
use v5.36;

my $number = shift || 55;
my ($multiple, $next, $solved) = (0,1,0);
until ($solved) {
	$multiple = $number * ++$next;

	# Test if number is comprised just 0's and 1's 
	if ($multiple =~ m/^([01]+)$/) {
		# Confirm it's not just all 1's
		$solved = ($multiple =~ m/0/);
	}
}
say "$number x $next = ".$multiple;
