#!/usr/bin/env perl
use v5.36;

use Test::More;
use List::MoreUtils qw/minmax/;

my $cases = [
	[3, 2, 1, 4],
	[3, 1],
	[2, 1, 3],
];

sub min_max
{
	my $l = shift;
    my ($max, $min) = minmax @$l;

    my @r = grep { $_ != $max && $_ != $min } @$l;

	return @r ? \@r : [-1];
}

is_deeply(min_max($cases->[0]), [3, 2], '[3, 2, 1, 4]');
is_deeply(min_max($cases->[1]), [-1],   '[3, 1]');
is_deeply(min_max($cases->[2]), [2],    '[2, 1, 3]');
done_testing();
