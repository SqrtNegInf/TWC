#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;
use List::Util qw/sum0/;

my $cases = [
	[[2, 5, 9, 11, 3], 1],
	[[2, 5, 9, 11, 3], 2],
	[[2, 5, 9, 11, 3], 0],
];

sub sum_of_values
{
	my ($l, $k) = $_[0]->@*;

	my $sum = 0;
	for my $i (0..$#$l) {
		my $ones = sum0(grep { $_ } split('', unpack("B32", pack("N", $i))));
		$sum += $l->[$i] if $ones == $k;
	}
	return $sum;
}

is(sum_of_values($cases->[0]), 17, 'Example 1');
is(sum_of_values($cases->[1]), 11, 'Example 2');
is(sum_of_values($cases->[2]),  2, 'Example 3');
done_testing();

exit 0;

