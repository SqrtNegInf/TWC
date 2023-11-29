#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

my $cases = [
	[8, 1, 2, 2, 3],
	[6, 5, 4, 8],
	[2, 2, 2],
];

sub count_smaller
{
	my $l = shift;
	
	my @sorted = sort {$a <=> $b} @$l;

	my @res;
	for my $i (0..$#$l) {
		for my $j (0..$#sorted) {
			if ($sorted[$j] >= $l->[$i]) {
				$res[$i] = $j;
				last;
			}
		}
	}
    return \@res;
}

is_deeply(count_smaller($cases->[0]), [4, 0, 1, 1, 3], '[8, 1, 2, 2, 3]');
is_deeply(count_smaller($cases->[1]), [2, 1, 0, 3],    '[6, 5, 4, 8]');
is_deeply(count_smaller($cases->[2]), [0, 0, 0],       '[2, 2, 2]');
done_testing();

exit 0;


