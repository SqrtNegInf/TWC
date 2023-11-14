#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

my $cases = [
	[[1, 2, 3], [2, 4, 6]],
	[[1, 2, 3, 3], [1, 1, 2, 2]],
];

sub missing_members
{
	my $l1 = $_[0]->[0];
	my $l2 = $_[0]->[1];

    my (%h1, %h2);
	$h1{$_} = 1 for @$l1;
	$h2{$_} = 1 for @$l2;

    --$h2{$_} for @$l1;
    --$h1{$_} for @$l2;

    my $ret = [[], []];

	for (sort keys %h1) {
		push @{$ret->[0]}, $_ if $h1{$_} > 0;
	}
	for (sort keys %h2) {
		push @{$ret->[1]}, $_ if $h2{$_} > 0;
	}

    return $ret;
}

is_deeply(missing_members($cases->[0]), [[1, 3], [4, 6]], '[[1, 2, 3], [2, 4, 6]]');
is_deeply(missing_members($cases->[1]), [[3],[]], '[[1, 2, 3, 3], [1, 1, 2, 2]]');

done_testing();

exit 0;


