#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use Data::Dumper;
use Date::Calc qw/Add_Delta_Days Day_of_Week/;

my $cases = [
	[ '2018-06-28', 3, ['2018-07-03']],
	[ '2018-06-28', 3],
];

sub banking_day_offset
{
	my $date     = $_[0]->[0];
	my $offset   = $_[0]->[1];
	my $holidays = $_[0]->[2];

	my %holidays = map { $_, 1 } @$holidays;

	my @date = split(/-/, $date);

	while ($offset > 0) {
		@date = Add_Delta_Days(@date, 1);
		my $dow = Day_of_Week(@date);
		--$offset unless $dow == 6 or $dow == 7 or defined $holidays{sprintf("%04d-%02d-%02d", @date)};
	}
	return sprintf("%04d-%02d-%02d", @date);
}

is(banking_day_offset($cases->[0]), '2018-07-04', 'Example 1');
is(banking_day_offset($cases->[1]), '2018-07-03', 'Example 2');
done_testing();

exit 0;
