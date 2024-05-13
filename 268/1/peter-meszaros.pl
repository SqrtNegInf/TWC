#!/usr/bin/env perl

use strict;
use warnings;
use Test2::V0 -no_srand;

#use Data::Dumper;

my $cases = [
	[[[3, 7, 5], [9, 5, 7]], 2],
	[[[1, 2, 1], [5, 4, 4]], 3],
	[[[2],       [5]],       3],
];

sub magic_number
{
	my $l1 = $_[0]->[0];
	my $l2 = $_[0]->[1];

    return undef unless @$l1 == @$l2;

	my @l1 = sort {$a <=> $b} @$l1;
	my @l2 = sort {$a <=> $b} @$l2;

    my $diff = $l2[0] - $l1[0];

    for (my $i=1; $i<@l1; $i++) {
        return undef if $l2[$i] - $l1[$i] != $diff;
    }
	return $diff;
}

for (@$cases) {
    is(magic_number($_->[0]), $_->[1], $_->[2]);
}

done_testing();
