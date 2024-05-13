#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	[[2, 5, 3, 4],             [3, 2, 5, 4]],
	[[9, 4, 1, 3, 6, 4, 6, 1], [1, 1, 4, 3, 6, 4, 9, 6]],
	[[1, 2, 2, 3],             [2, 1, 3, 2]],
];

sub number_game
{
	my $l = shift;

    return undef if @$l % 2;

	my @l = sort {$a <=> $b} @$l;
	my @res;

	for (my $i=0; $i<@l; $i+=2 ) {
		push @res, @l[$i+1, $i];
	}

	return \@res;
}

for (@$cases) {
    is(number_game($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;

