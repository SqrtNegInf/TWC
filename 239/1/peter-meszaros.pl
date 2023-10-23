#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;

my $cases = [
    [["ab", "c"], ["a", "bc"]],
    [["ab", "c"], ["ac", "b"]],
    [["ab", "cd", "e"], ["abcde"]],
];

sub same_string
{
	my ($arr1, $arr2) = $_[0]->@*;

	my $w1 = join('', @$arr1);
	my $w2 = join('', @$arr2);
    return $w1 eq $w2 ? 1 : 0;
}

is(same_string($cases->[0]), 1, '[["ab", "c"], ["a", "bc"]]');
is(same_string($cases->[1]), 0, '[["ab", "c"], ["ac", "b"]]');
is(same_string($cases->[2]), 1, '[["ab", "cd", "e"], ["abcde"]]');
done_testing();

exit 0;


