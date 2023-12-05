#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;
use Algorithm::Combinatorics qw/variations/;

my $cases = [
	[8, 1, 9],
	[8, 6, 7, 1, 0],
	[1],
];

sub largest_of_three
{
	my $l = shift;

	my $num = -1;
    my @l;
	for my $k (1..(scalar @$l)) {
		my $iter = variations($l, $k);
		while (my $p = $iter->next) {
			push @l, 0+join('', @$p);
		}
	}

    for my $n (sort {$b <=> $a} @l) {
		if ($n % 3 == 0) {
			$num = $n;
			last;
		}
	}

    return $num;
}

is(largest_of_three($cases->[0]),  981, '[8, 1, 9]');
is(largest_of_three($cases->[1]), 8760, '[8, 6, 7, 1, 0]');
is(largest_of_three($cases->[2]),   -1, '[1]');
done_testing();

exit 0;
