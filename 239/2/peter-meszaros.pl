#!/usr/bin/env perl
use v5.36;

use Test::More;
use Data::Dumper;

my $cases = [
	[["ad", "bd", "aaab", "baa", "badab"], "ab"],
	[["a", "b", "c", "ab", "ac", "bc", "abc"], "abc"],
	[["cc", "acd", "b", "ba", "bac", "bad", "ac", "d"], "cad"],
];

sub consistent_strings
{
	my ($strs, $allowed) = $_[0]->@*;

	my %allowed = map { $_ => 1} split('', $allowed);

	my $cnt = 0;
	WORD: for my $w (@$strs) {
		my @w = split('', $w);
		for my $c (@w) {
			next WORD unless exists $allowed{$c};
		}
		++$cnt;
	}

	return $cnt;
}

is(consistent_strings($cases->[0]), 2,  '[["ad", "bd", "aaab", "baa", "badab"], "ab"]');
is(consistent_strings($cases->[1]), 7,  '[["a", "b", "c", "ab", "ac", "bc", "abc"], "abc"]');
is(consistent_strings($cases->[2]), 4,  '[["cc", "acd", "b", "ba", "bac", "bad", "ac", "d"], "cad"]');
done_testing();

exit 0;
