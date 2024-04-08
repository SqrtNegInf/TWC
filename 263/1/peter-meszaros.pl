#!/usr/bin/env perl

use strict;
use warnings;

use Test2::V0 -srand => 1;
use Data::Dumper;

my $cases = [
	[[[1, 5, 3, 2, 4, 2], 2], [1, 2], 'Example 1'],
	[[[1, 2, 4, 3, 5],    6], [],     'Example 2'],
	[[[5, 3, 2, 4, 2, 1], 4], [4],    'Example 3'],
];

sub target_index
{
	my $l = $_->[0]->[0];
	my $k = $_->[0]->[1];
	
	my @l = sort {$a <=> $b} @$l;
	my @res;
	
	my $found;
	for (0..$#l) {
	    if ($l[$_] == $k) {
			push @res, $_;
			$found = 1;
		} elsif ($found) {
			last;
		}
	}
	return \@res;
}

for (@$cases) {
    is(target_index($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;
