#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;
use Date::Calc qw/Nth_Weekday_of_Month_Year/;

my $cases = [
	# Year, Month, Weekday of month, day of week
	[ 2024,  4, 3,  2],
	[ 2025, 10, 2,  4],
	[ 2026,  8, 5,  3],
];

sub seize_the_day
{
	my $l = shift;

	my (undef, undef, $day) =
		Nth_Weekday_of_Month_Year($l->[0],
                                  $l->[1],
                                  $l->[3],
                                  $l->[2]);

    return $day // 0;
}

is(seize_the_day($cases->[0]), 16, '[ 2024,  4, 3,  2]');
is(seize_the_day($cases->[1]),  9, '[ 2025, 10, 2,  4]');
is(seize_the_day($cases->[2]),  0, '[ 2026,  8, 5,  3]');
done_testing();

exit 0;


