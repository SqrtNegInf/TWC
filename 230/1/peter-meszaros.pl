#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
	[1, 34, 5, 6],
	[1, 24, 51, 60],
];

sub separate_digits
{
	my $arr = shift;

    my @res;
	push @res, split('') for @$arr;

	return \@res;
}

is_deeply(separate_digits($cases->[0]), [1, 3, 4, 5, 6],       '[1, 34, 5, 6]');
is_deeply(separate_digits($cases->[1]), [1, 2, 4, 5, 1, 6, 0], '[1, 24, 51, 60]');
done_testing;
