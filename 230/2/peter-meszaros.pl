#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
    [["pay", "attention", "practice", "attend"], "at"],
    [["janet", "julia", "java", "javascript"],   "ja"],
];

sub count_words
{
    my ($arr, $prefix) = ($_[0]->[0], $_[0]->[1]);

    my $cnt = 0;
    my $prefreg = qr/^$prefix/;

	for (@$arr) {
		++$cnt if /$prefreg/;
	}

    return $cnt;
}

is(count_words($cases->[0]), 2, '["pay", "attention", "practice", "attend"], "at"');
is(count_words($cases->[1]), 3, '["janet", "julia", "java", "javascript"], "ja"');
done_testing;
