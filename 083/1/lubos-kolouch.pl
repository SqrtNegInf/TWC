#!/usr/bin/env perl
use v5.36;

sub get_words_length {
	my $words = shift;

	# split on whitespace
	my @split_words = split /\s+/, $words;

	my $total_length;

	# skip the first and the last word
	for my $i (1..scalar @split_words-2) {
		$total_length += length($split_words[$i]);
	}

	return $total_length;
}


use Test::More;

is(get_words_length("The Weekly Challenge"), 6);
is(get_words_length("The purpose of our lives is to be happy"), 23);
is(get_words_length("Markmið lífs okkar er að vera hamingjusöm"), 19);

done_testing;
