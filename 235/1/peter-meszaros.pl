#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $cases = [
    [0, 2, 9, 4, 6],
    [5, 1, 3, 2],
    [2, 2, 3],
];

sub remove_one
{
    my $l = shift;

    my $e = shift @$l;
	my $r;
    while (my $n = shift @$l) {
		if ($e >= $n) {
			++$r;
			return 0 if $r > 1;
		}
		$e = $n;
    }
	return 1;
}

is(remove_one($cases->[0]), 1, '[0, 2, 9, 4, 6]');
is(remove_one($cases->[1]), 0, '[5, 1, 3, 2]');
is(remove_one($cases->[2]), 1, '[2, 2, 3]');
done_testing();
