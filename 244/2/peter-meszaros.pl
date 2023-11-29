#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;
use Algorithm::Combinatorics qw/combinations/;
use List::Util qw/max min/;

my $cases = [
	[2, 1, 4],
];

sub group_hero
{
	my $l = shift;

	my $sum = 0;
	for my $i (0..$#$l) {
		my $iter = combinations($l, $i+1);
		while (my $c = $iter->next) {
			my $max = max @$c;
			my $min = min @$c;
			$sum += $max**2 * $min;
        }
	}

    return $sum;
}

is(group_hero($cases->[0]), 141, '[2, 1, 4]');
done_testing();
