#!/usr/bin/env perl
use v5.36;

use Date::Calc qw/Day_of_Week/;
use Test::More;

my $cases = [
	1753,
	2023,
	9999,
];

sub friday13th
{
    my $y = shift;
	my $c = 0;
	for my $m (1..12) {
		my $dow = Day_of_Week($y, $m, 13);
		++$c if $dow == 5; # Friday
	}
	return $c;
}

is(friday13th($cases->[0]),    2, 'year 1753');
is(friday13th($cases->[1]),    2, 'year 2023');
is(friday13th($cases->[2]),    1, 'year 9999');
done_testing();
