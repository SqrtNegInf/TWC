#!/usr/bin/env perl
use v5.36;

odd_one_out('abc', 'xyz', 'tsu');
odd_one_out('rat', 'cab', 'dad');
odd_one_out('x', 'y', 'z');
odd_one_out('hippy', 'afoot', 'in', 'chilly', 'abbey');
odd_one_out('write', 'a', 'script', 'to', 'remove', 'all', 'words', 'not', 'sorted', 'alphabetically');
odd_one_out('abc', 'aBc', 'abC', 'bcA');

sub odd_one_out {
	
	my ($word, $count);
	
	$count = 0;
	for $word (@_) {
		$count ++ if lc($word) ne join('', sort split('', lc($word)));
	}
	say qq[\nInput:  \@words = ('] . join(q[', '], @_) . q[')];
	say qq[Output: $count];
}
