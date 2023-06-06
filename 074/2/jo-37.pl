#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;
use warnings FATAL => 'all';

use List::Util qw(first);

sub nr_char {
	my @arr = split //, shift;
	# mode: fnr or lnr
	my $lnr = shift;
	my (%freq, @head);

	join '', map {
		# While traversing the input string character-wise,
		# count frequencies and collect the (reversed) head.
		$freq{$_}++;

		# Emulate unshift (lnr, reversed) or push (fnr, forward)
		# to augment the head.
		splice @head, $lnr ? 0 : @head, 0, $_;

		# The first singleton character from the (reversed) head
		# is the requested output character.
		(first {$freq{$_} == 1} @head) // '#';
	} @arr;
}

is nr_char('ababc', 1), 'abb#c', 'first example, lnr';
is nr_char('xyzzyx', 1), 'xyzyx#', 'second example, lnr';
is nr_char('ababc'), 'aab#c', 'first example, fnr';
is nr_char('xyzzyx'), 'xxxxx#', 'second example, fnr';

done_testing;
