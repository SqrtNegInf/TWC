#!/usr/bin/env perl
use v5.36;

use List::Util qw/min/;
use Test::More;

my $cases = [
    [3, 4, 2],
    [1, 2, 3],
];

sub empty_array
{
	my @a = $_[0]->@*;

	my $numop = 0;
    while (@a) {
		if (min(@a) < $a[0]) {
			push @a, $a[0];
		}
		shift @a;
		++$numop;
		
	}
    return $numop;
}

is(empty_array($cases->[0]), 5, '[3, 4, 2]');
is(empty_array($cases->[1]), 3, '[1, 2, 3]');
done_testing();

exit 0;
