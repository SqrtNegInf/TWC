#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;
use Data::Dumper;

my $cases = [
	[["Perl Weekly Challenge",    ['l', 'a']], 0],
	[["Perl and Raku",            ['a']],      1],
	[["Well done Team PWC",       ['l', 'o']], 2],
	[["The joys of polyglottism", ['T']],      2],
];

sub broken_keys
{
	my $s    = $_[0]->[0];
	my $keys = $_[0]->[1];

	my $cnt = 0;
	my %h;

	WORD: for my $w (split / /, $s) {
		for my $k (@$keys) {
			next WORD unless index(lc($w), lc($k)) < 0;
		}
		++$cnt;
    }

	return $cnt;

}

for (@$cases) {
    is(broken_keys($_->[0]), $_->[1], $_->[2]);
}
done_testing();

exit 0;
